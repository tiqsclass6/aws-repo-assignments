# https://www.terraform.io/language/values/outputs

data "aws_caller_identity" "current" {}

output "account_id" {
  value       = data.aws_caller_identity.current.account_id
  description = "The AWS Account ID of the account"
}

output "vpc_name" {
  value       = aws_vpc.main.tags["Name"]
  description = "Name of the main VPC"
}

output "vpc_cidr_block" {
  value       = aws_vpc.main.cidr_block
  description = "CIDR block of the main VPC"
}

output "vpc_id" {
  value       = aws_vpc.main.id
  description = "VPC ID of the main VPC"
}

output "vpc_region" {
  value       = aws_vpc.main.region
  description = "Region of the main VPC"
}

output "ec2_instance_private_ip" {
  value       = aws_instance.ec2_japan.private_ip
  description = "Private IP address of the Japan EC2 instance"
}