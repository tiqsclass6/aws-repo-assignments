# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group

resource "aws_lb_target_group" "web-server-tg1" {
  name        = "web-server-http"
  target_type = "instance"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.main.id

  health_check {
    enabled             = true
    interval            = 30
    path                = "/"
    protocol            = "HTTP"
    healthy_threshold   = 5
    unhealthy_threshold = 2
    matcher             = "200"
  }

  tags = {
    Name = "web-server-http"
  }
}

resource "aws_lb_target_group" "web-server-tg2" {
  name        = "web-server-https"
  target_type = "instance"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.main.id

  health_check {
    enabled             = true
    interval            = 30
    path                = "/"
    protocol            = "HTTP"
    healthy_threshold   = 5
    unhealthy_threshold = 2
    matcher             = "200"
  }

  tags = {
    Name = "web-server-https"
  }
}