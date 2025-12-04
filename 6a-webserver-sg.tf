# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_security_group_ingress_rule
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_security_group_egress_rule

# T.I.Q.S. Public Security Group
resource "aws_security_group" "web-server" {
  name        = "web-server"
  description = "Web Server SG"
  vpc_id      = aws_vpc.main.id

  tags = {
    Name = "web-server"
  }
}

resource "aws_vpc_security_group_ingress_rule" "web-server-ingress-http" {
  security_group_id = aws_security_group.web-server.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "tcp"
  from_port         = 80
  to_port           = 80

  tags = {
    Name = "HTTP"
  }
}

resource "aws_vpc_security_group_ingress_rule" "web-server-ingress-ssh" {
  security_group_id = aws_security_group.web-server.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "tcp"
  from_port         = 22
  to_port           = 22

  tags = {
    Name = "SSH"
  }
}

resource "aws_vpc_security_group_egress_rule" "web-server-egress" {
  security_group_id = aws_security_group.web-server.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}