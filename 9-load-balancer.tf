resource "aws_lb" "tiqs-lb" {
  name               = "tiqs-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.tiqs-lb-sg.id]
  subnets = [
    aws_subnet.tiqs-public-1.id,
    aws_subnet.tiqs-public-2.id,
    aws_subnet.tiqs-public-3.id
  ]

  enable_deletion_protection = false

  tags = {
    Name = "tiqs-lb"
  }
}

resource "aws_lb_listener" "tiqs-lb-listener" {
  load_balancer_arn = aws_lb.tiqs-lb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tiqs-tg.arn
  }
}
