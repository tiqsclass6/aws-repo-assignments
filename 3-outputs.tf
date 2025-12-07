output "bucket_information" {
  value = {
    name        = aws_s3_bucket.static_site.bucket
    arn         = aws_s3_bucket.static_site.arn
  }
}

output "error_html_url" {
  description = "URL of the error.html object in the S3 bucket"
  value       = "http://${aws_s3_bucket.static_site.bucket}.s3-website-${var.region}.amazonaws.com/error.html"
}

output "index_html_url" {
  description = "URL of the index.html object in the S3 bucket"
  value       = "http://${aws_s3_bucket.static_site.bucket}.s3-website-${var.region}.amazonaws.com/index.html"
}

output "website_url" {
  description = "URL of the S3 static website endpoint"
  value       = "http://${aws_s3_bucket_website_configuration.website.website_endpoint}"
}

