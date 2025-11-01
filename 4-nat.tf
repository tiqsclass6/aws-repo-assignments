# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/nat_gateway

#### Elastic IP for NAT Gateway ####
resource "aws_eip" "nat" {
  domain     = "vpc"
  depends_on = [aws_internet_gateway.tiqs-igw]
}

#### NAT Gateway ####
resource "aws_nat_gateway" "tiqs-nat" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.tiqs-public-1.id

  tags = {
    Name = "tiqs"
  }

  depends_on = [aws_internet_gateway.tiqs-igw]
}
