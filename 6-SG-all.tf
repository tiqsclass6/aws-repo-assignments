# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_security_group_ingress_rule
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_security_group_egress_rule

# T.I.Q.S. Public Security Group
resource "aws_security_group" "tiqs-public-sg" {
  name        = "tiqs-public-sg"
  description = "Public SG for TIQS resources"
  vpc_id      = aws_vpc.tiqs.id

  tags = {
    Name = "tiqs-public-sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "tiqs-public-sg-ingress-http" {
  security_group_id = aws_security_group.tiqs-public-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "tcp"
  from_port         = 80
  to_port           = 80
  
  tags = {
    Name = "HTTP"
  }
}

resource "aws_vpc_security_group_ingress_rule" "tiqs-public-sg-ingress-ssh" {
  security_group_id = aws_security_group.tiqs-public-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "tcp"
  from_port         = 22
  to_port           = 22
  
  tags = {
    Name = "SSH"
  }
}

resource "aws_vpc_security_group_egress_rule" "tiqs-public-sg-egress" {
  security_group_id = aws_security_group.tiqs-public-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}

# T.I.Q.S. Private Security Group
resource "aws_security_group" "tiqs-private-sg" {
  name        = "tiqs-private-sg"
  description = "Private SG for TIQS resources"
  vpc_id      = aws_vpc.tiqs.id

  tags = {
    Name = "tiqs-private-sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "tiqs-private-sg-ingress-http" {
  security_group_id = aws_security_group.tiqs-private-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "tcp"
  from_port         = 80
  to_port           = 80

  tags = {
    Name = "HTTP"
  }
}

resource "aws_vpc_security_group_ingress_rule" "tiqs-private-sg-ingress-ssh" {
  security_group_id = aws_security_group.tiqs-private-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "tcp"
  from_port         = 22
  to_port           = 22

  tags = {
    Name = "SSH"
  }
}

resource "aws_vpc_security_group_egress_rule" "tiqs-private-sg-egress" {
  security_group_id = aws_security_group.tiqs-private-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}