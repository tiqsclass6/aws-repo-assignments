# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener

resource "aws_lb" "web-server" {
  name               = "web-server"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.lb.id]
  subnets = [
    aws_subnet.public-1.id,
    aws_subnet.public-2.id,
    aws_subnet.public-3.id
  ]

  enable_deletion_protection = false

  tags = {
    Name = "web-server"
  }
}

resource "aws_lb_listener" "web-server-listener-http" {
  load_balancer_arn = aws_lb.web-server.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.web-server-tg1.arn
  }
}

data "aws_acm_certificate" "cert" {
  domain      = "theinternationalquietstorm.com"
  statuses    = ["ISSUED"]
  most_recent = true
}

resource "aws_lb_listener" "web-server-listener-https" {
  load_balancer_arn = aws_lb.web-server.arn
  port              = 443
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-TLS13-1-2-Res-PQ-2025-09"
  certificate_arn   = data.aws_acm_certificate.cert.arn

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.web-server-tg2.arn
  }
}