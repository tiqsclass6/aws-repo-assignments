# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet

# Public Subnets
resource "aws_subnet" "public-1" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.230.1.0/24"
  availability_zone = "ap-northeast-1a"

  tags = {
    Name = "public-1"
  }
}

resource "aws_subnet" "public-2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.230.2.0/24"
  availability_zone = "ap-northeast-1b"

  tags = {
    Name = "public-2"
  }
}
resource "aws_subnet" "public-3" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.230.3.0/24"
  availability_zone = "ap-northeast-1c"

  tags = {
    Name = "public-3"
  }
}