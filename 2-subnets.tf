resource "aws_subnet" "tiqs-public1" {
  vpc_id                  = aws_vpc.tiqs.id
  cidr_block              = "10.245.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "tiqs-public1"
  }
}

resource "aws_subnet" "tiqs-private1" {
  vpc_id            = aws_vpc.tiqs.id
  cidr_block        = "10.245.11.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "tiqs-private1"
  }
}

resource "aws_subnet" "tiqs-private2" {
  vpc_id            = aws_vpc.tiqs.id
  cidr_block        = "10.245.12.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "tiqs-private2"
  }
}

resource "aws_subnet" "tiqs-private3" {
  vpc_id            = aws_vpc.tiqs.id
  cidr_block        = "10.245.13.0/24"
  availability_zone = "us-east-1c"

  tags = {
    Name = "tiqs-private3"
  }
}