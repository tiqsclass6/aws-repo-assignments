# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway

# Internet Gateway
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "main"
  }
}
