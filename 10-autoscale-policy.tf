# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_group
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_policy
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_attachment

resource "aws_autoscaling_group" "venezuela" {
  name              = "venezuela"
  target_group_arns = [aws_lb_target_group.web-server.arn]
  desired_capacity  = 6
  max_size          = 9
  min_size          = 3
  force_delete      = true
  vpc_zone_identifier = [
    aws_subnet.private-1.id,
    aws_subnet.private-2.id,
    aws_subnet.private-3.id
  ]
  health_check_type         = "ELB"
  health_check_grace_period = 300

  launch_template {
    id      = aws_launch_template.venezuela-template.id
    version = "$Latest"
  }

  enabled_metrics = ["GroupMinSize", "GroupMaxSize", "GroupDesiredCapacity", "GroupInServiceInstances", "GroupTotalInstances"]

  initial_lifecycle_hook {
    name                  = "instance-protection-launch"
    lifecycle_transition  = "autoscaling:EC2_INSTANCE_LAUNCHING"
    default_result        = "CONTINUE"
    heartbeat_timeout     = 60
    notification_metadata = "{\"key\":\"value\"}"
  }

  initial_lifecycle_hook {
    name                 = "scale-in-protection"
    lifecycle_transition = "autoscaling:EC2_INSTANCE_TERMINATING"
    default_result       = "CONTINUE"
    heartbeat_timeout    = 300
  }

  tag {
    key                 = "Name"
    value               = "venezuela"
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_policy" "venezuela-policy" {
  name                   = "venezuela-policy"
  autoscaling_group_name = aws_autoscaling_group.venezuela.name

  policy_type               = "TargetTrackingScaling"
  estimated_instance_warmup = 120

  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value = 75.0
  }
}

# Create a new ALB Target Group attachment
resource "aws_autoscaling_attachment" "venezuela" {
  autoscaling_group_name = aws_autoscaling_group.venezuela.id
  lb_target_group_arn    = aws_lb_target_group.web-server.arn
}
