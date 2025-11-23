# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/nat_gateway

# Elastic IP for NAT Gateway
resource "aws_eip" "private" {
  domain     = "vpc"
  depends_on = [aws_internet_gateway.main]
}

# NAT Gateway
resource "aws_nat_gateway" "private" {
  allocation_id = aws_eip.private.id
  subnet_id     = aws_subnet.public-1.id

  tags = {
    Name = "private"
  }

  depends_on = [aws_internet_gateway.main]
}
