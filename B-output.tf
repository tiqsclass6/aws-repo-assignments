# output "ip_address" {
#   value = aws_instance.tiqs-ec2-instance.public_ip
# }

# output "website_url" {
#   value = "http://${aws_instance.tiqs-ec2-instance.public_dns}"
# }

output "lb_dns_name" {
  value       = "http://${aws_lb.tiqs-lb.dns_name}"
  description = "The DNS name of the Auto Scale Group 01 - Load Balancer."
}