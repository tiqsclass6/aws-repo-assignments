# https://www.terraform.io/language/values/outputs

output "lb_dns_name_http" {
  value       = "http://${aws_route53_record.www.name}"
  description = "Venezuela Webserver (Port 80 - HTTP)"
}

output "lb_dns_name_https" {
  value       = "https://${aws_route53_record.www.name}"
  description = "Ethiopia Webserver (Port 443 - HTTPS)"
}

# output "private_key" {
#   value     = tls_private_key.MySecureKey.private_key_pem
#   sensitive = true
# }

# output "public_key" {
#   value = data.tls_public_key.MySecureKey.public_key_openssh
# }