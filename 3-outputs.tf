output "bucket_information" {
  value = {
    name = aws_s3_bucket.static_site.bucket
    arn  = aws_s3_bucket.static_site.arn
  }
}
output "website_url" {
  description = "URL of the S3 static website endpoint"
  value       = "http://${aws_s3_bucket_website_configuration.website.website_endpoint}"
}

