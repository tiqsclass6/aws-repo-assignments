output "bucket_name" {
  value = aws_s3_bucket.static_site.bucket
}

output "website_url" {
  description = "URL of the S3 static website endpoint"
  value       = "http://${aws_s3_bucket_website_configuration.website.website_endpoint}"
}
