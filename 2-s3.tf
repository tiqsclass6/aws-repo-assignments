# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_website_configuration
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_ownership_controls
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_policy
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_object

variable "region" {
  description = "The AWS region where resources will be created"
  type        = string
  default     = "eu-south-2"
}

resource "aws_s3_bucket" "static_site" {
  bucket        = "tiqs-spain-static-site"
  force_destroy = true
}

resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.static_site.bucket

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "wifey.html"
  }
}

resource "aws_s3_bucket_public_access_block" "public_access" {
  bucket                  = aws_s3_bucket.static_site.id
  block_public_acls       = true
  block_public_policy     = false
  ignore_public_acls      = true
  restrict_public_buckets = false
}

resource "aws_s3_bucket_ownership_controls" "ownership" {
  bucket = aws_s3_bucket.static_site.id

  rule {
    object_ownership = "BucketOwnerEnforced"
  }
}

resource "aws_s3_bucket_policy" "public_policy" {
  depends_on = [
    aws_s3_bucket_public_access_block.public_access,
    aws_s3_bucket_ownership_controls.ownership,
  ]

  bucket = aws_s3_bucket.static_site.id

  policy = jsonencode({
    Version : "2012-10-17",
    Statement : [
      {
        Sid : "PublicReadGetObject",
        Effect : "Allow",
        Principal : "*",
        Action : "s3:GetObject",
        Resource : "${aws_s3_bucket.static_site.arn}/*"
      }
    ]
  })
}

resource "aws_s3_object" "index_html" {
  bucket       = aws_s3_bucket.static_site.id
  key          = "index.html"
  source       = "${path.root}/A-index.html"
  content_type = "text/html"
  etag         = filemd5("${path.root}/A-index.html")
}

resource "aws_s3_object" "error_html" {
  bucket       = aws_s3_bucket.static_site.id
  key          = "wifey.html"
  source       = "${path.root}/B-wifey.html"
  content_type = "text/html"
  etag         = filemd5("${path.root}/B-wifey.html")
}