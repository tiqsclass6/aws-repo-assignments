# https://www.terraform.io/language/values/outputs

output "lb_dns_name" {
  value       = "http://${aws_lb.web-server.dns_name}"
  description = "The DNS name of the Auto Scale Group 01 - Load Balancer."
}