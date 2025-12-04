# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_security_group_ingress_rule
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_security_group_egress_rule

# T.I.Q.S. Load Balancer Security Group
resource "aws_security_group" "lb" {
  name        = "lb"
  description = "Load Balancer SG for TIQS resources"
  vpc_id      = aws_vpc.main.id

  tags = {
    Name = "lb"
  }
}

resource "aws_vpc_security_group_ingress_rule" "lb-ingress-http" {
  security_group_id = aws_security_group.lb.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "tcp"
  from_port         = 80
  to_port           = 80

  tags = {
    Name = "HTTP"
  }
}

resource "aws_vpc_security_group_ingress_rule" "lb-ingress-icmp" {
  security_group_id = aws_security_group.lb.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "icmp"
  from_port         = -1
  to_port           = -1

  tags = {
    Name = "ICMP"
  }
}

resource "aws_vpc_security_group_egress_rule" "lb-egress" {
  security_group_id = aws_security_group.lb.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}