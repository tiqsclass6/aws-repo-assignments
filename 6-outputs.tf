output "cloudfront_domain_name" {
  description = "CloudFront distribution domain name"
  value       = "https://${aws_cloudfront_distribution.cdn.domain_name}"
}

# output "acm_certificate_arn" {
#   description = "ACM certificate used for CloudFront"
#   value       = data.aws_acm_certificate.cert.arn
# }

# output "s3_bucket_name" {
#   description = "Name of the S3 bucket"
#   value       = aws_s3_bucket.site.bucket
# }