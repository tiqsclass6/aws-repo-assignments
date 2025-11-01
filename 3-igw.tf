# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway

#### Internet Gateway ####
resource "aws_internet_gateway" "tiqs-igw" {
  vpc_id = aws_vpc.tiqs.id

  tags = {
    Name = "tiqs"
  }
}
