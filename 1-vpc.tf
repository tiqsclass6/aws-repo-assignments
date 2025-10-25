resource "aws_vpc" "tiqs" {
  cidr_block = "10.245.0.0/16"

  tags = {
    Name = "tiqs"
  }
}
