# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_notification
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic_subscription

resource "aws_autoscaling_notification" "asg-notifications" {
  group_names = [
    aws_autoscaling_group.hungary.name,
    aws_autoscaling_group.japan.name
  ]

  notifications = [
    "autoscaling:EC2_INSTANCE_LAUNCH",
    "autoscaling:EC2_INSTANCE_TERMINATE",
    "autoscaling:EC2_INSTANCE_LAUNCH_ERROR",
    "autoscaling:EC2_INSTANCE_TERMINATE_ERROR",
  ]

  topic_arn = aws_sns_topic.email.arn
}

resource "aws_sns_topic" "email" {
  name = "email-notification"
}

resource "aws_sns_topic_subscription" "email-subscription-1" {
  topic_arn = aws_sns_topic.email.arn
  protocol  = "email"
  endpoint  = "bjett2000@hotmail.com"
}