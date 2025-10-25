https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc

#### Create VPC ####
resource "aws_vpc" "tiqs" {
  cidr_block           = "10.230.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "tiqs"
  }
}
