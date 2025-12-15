# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudfront_distribution
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudfront_origin_access_control
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/acm_certificate
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_policy
# https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudfront_invalidation

locals {
  cf_name   = "demo-cloudfront-tiqs-v3"
  origin_id = "s3-origin-${aws_s3_bucket.site.id}"

  cf_tags = {
    Name = local.cf_name
  }

  objects_hash = sha1(join(",", sort([
    for o in aws_s3_object.site_objects : o.etag
  ])))

  s3_policy_json_path = "${path.module}/s3_bucket_policy.json"
}

data "aws_acm_certificate" "cert" {
  provider = aws.us_east_1

  domain      = var.domain_name
  statuses    = ["ISSUED"]
  most_recent = true
}

data "aws_iam_policy_document" "s3_policy" {
  statement {
    sid = "AllowCloudFrontReadOnly"

    principals {
      type        = "Service"
      identifiers = ["cloudfront.amazonaws.com"]
    }

    actions = ["s3:GetObject"]

    resources = ["${aws_s3_bucket.site.arn}/*"]

    condition {
      test     = "StringEquals"
      variable = "AWS:SourceArn"
      values   = [aws_cloudfront_distribution.cdn.arn]
    }
  }
}

resource "local_file" "s3_policy_json" {
  filename = local.s3_policy_json_path
  content  = data.aws_iam_policy_document.s3_policy.json
}

resource "aws_cloudfront_origin_access_control" "oac" {
  name                              = "${var.project_name}-oac"
  description                       = "OAC for ${aws_s3_bucket.site.bucket}"
  origin_access_control_origin_type = "s3"
  signing_behavior                  = "always"
  signing_protocol                  = "sigv4"
}

resource "aws_cloudfront_distribution" "cdn" {
  enabled             = true
  comment             = local.cf_name
  default_root_object = "index.html"

  aliases = [var.domain_name]

  price_class = "PriceClass_100"

  origin {
    domain_name              = aws_s3_bucket.site.bucket_regional_domain_name
    origin_id                = local.origin_id
    origin_access_control_id = aws_cloudfront_origin_access_control.oac.id

    s3_origin_config {
      origin_access_identity = ""
    }
  }

  default_cache_behavior {
    target_origin_id       = local.origin_id
    viewer_protocol_policy = "redirect-to-https"

    allowed_methods = ["GET", "HEAD", "OPTIONS"]
    cached_methods  = ["GET", "HEAD"]

    compress = true

    forwarded_values {
      query_string = false
      cookies {
        forward = "none"
      }
    }
  }

  custom_error_response {
    error_code            = 403
    response_code         = 403
    response_page_path    = "/error.html"
    error_caching_min_ttl = 300
  }

  custom_error_response {
    error_code            = 404
    response_code         = 404
    response_page_path    = "/error.html"
    error_caching_min_ttl = 300
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    acm_certificate_arn      = data.aws_acm_certificate.cert.arn
    ssl_support_method       = "sni-only"
    minimum_protocol_version = "TLSv1.3_2025"
  }

  http_version = "http2"

  tags = local.cf_tags
}

resource "terraform_data" "cloudfront_invalidation" {
  triggers_replace = {
    distribution_id = aws_cloudfront_distribution.cdn.id
  }

  provisioner "local-exec" {
    interpreter = ["PowerShell", "-NoProfile", "-NonInteractive", "-Command"]
    command     = "aws cloudfront create-invalidation --distribution-id ${aws_cloudfront_distribution.cdn.id} --paths '/*'"
  }

  depends_on = [aws_cloudfront_distribution.cdn]
}
