# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_versioning
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_object

locals {
  site_objects = {
    "index.html" = {
      source       = "${path.module}/index.html"
      content_type = "text/html"
    }
    "error.html" = {
      source       = "${path.module}/error.html"
      content_type = "text/html"
    }
  }
}

resource "aws_s3_bucket" "site" {
  bucket = var.project_name

  tags = {
    Name = var.project_name
  }
}

resource "aws_s3_bucket_versioning" "site_versioning" {
  bucket = aws_s3_bucket.site.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_public_access_block" "site" {
  bucket = aws_s3_bucket.site.id

  block_public_acls       = true
  ignore_public_acls      = true
  block_public_policy     = true
  restrict_public_buckets = true
}

resource "aws_s3_object" "site_objects" {
  for_each = local.site_objects

  bucket       = aws_s3_bucket.site.id
  key          = each.key
  source       = each.value.source
  content_type = each.value.content_type
  etag         = filemd5(each.value.source)
}
