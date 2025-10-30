# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association


#### Public Route Table and Associations ####
resource "aws_route_table" "tiqs-public-rtb" {
  vpc_id = aws_vpc.tiqs.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.tiqs.id
  }

  tags = {
    Name = "tiqs-public-rtb"
  }
}

resource "aws_route_table_association" "public-1" {
  subnet_id      = aws_subnet.tiqs-public-1.id
  route_table_id = aws_route_table.tiqs-public-rtb.id
}

resource "aws_route_table_association" "public-2" {
  subnet_id      = aws_subnet.tiqs-public-2.id
  route_table_id = aws_route_table.tiqs-public-rtb.id
}

resource "aws_route_table_association" "public-3" {
  subnet_id      = aws_subnet.tiqs-public-3.id
  route_table_id = aws_route_table.tiqs-public-rtb.id
}


##### Private Route Table and Associations ####
resource "aws_route_table" "tiqs-private-rtb" {
  vpc_id = aws_vpc.tiqs.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.tiqs.id
  }

  tags = {
    Name = "tiqs-private-rtb"
  }
}

resource "aws_route_table_association" "private-1" {
  subnet_id      = aws_subnet.tiqs-private-1.id
  route_table_id = aws_route_table.tiqs-private-rtb.id
}

resource "aws_route_table_association" "private-2" {
  subnet_id      = aws_subnet.tiqs-private-2.id
  route_table_id = aws_route_table.tiqs-private-rtb.id
}

resource "aws_route_table_association" "private-3" {
  subnet_id      = aws_subnet.tiqs-private-3.id
  route_table_id = aws_route_table.tiqs-private-rtb.id
}