# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet

#### Public Subnets ####
resource "aws_subnet" "tiqs-public-1" {
  vpc_id            = aws_vpc.tiqs.id
  cidr_block        = "10.230.1.0/24"
  availability_zone = "sa-east-1a"

  tags = {
    Name = "tiqs-public-1"
  }
}

resource "aws_subnet" "tiqs-public-2" {
  vpc_id            = aws_vpc.tiqs.id
  cidr_block        = "10.230.2.0/24"
  availability_zone = "sa-east-1b"

  tags = {
    Name = "tiqs-public-2"
  }
}
resource "aws_subnet" "tiqs-public-3" {
  vpc_id            = aws_vpc.tiqs.id
  cidr_block        = "10.230.3.0/24"
  availability_zone = "sa-east-1c"

  tags = {
    Name = "tiqs-public-3"
  }
}

#### Private Subnets ####
resource "aws_subnet" "tiqs-private-1" {
  vpc_id            = aws_vpc.tiqs.id
  cidr_block        = "10.230.11.0/24"
  availability_zone = "sa-east-1a"

  tags = {
    Name = "tiqs-private-1"
  }
}

resource "aws_subnet" "tiqs-private-2" {
  vpc_id            = aws_vpc.tiqs.id
  cidr_block        = "10.230.12.0/24"
  availability_zone = "sa-east-1b"

  tags = {
    Name = "tiqs-private-2"
  }
}
resource "aws_subnet" "tiqs-private-3" {
  vpc_id            = aws_vpc.tiqs.id
  cidr_block        = "10.230.13.0/24"
  availability_zone = "sa-east-1c"

  tags = {
    Name = "tiqs-private-3"
  }
}