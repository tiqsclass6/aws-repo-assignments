# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/launch_template

resource "aws_launch_template" "venezuela-template" {
  name_prefix   = "venezuela-template"
  description   = "venezuela-template"
  image_id      = "ami-02040ca09ead0f460"
  instance_type = "t3.micro"
  # key_name      = "basiclinux"

  vpc_security_group_ids = [aws_security_group.web-server.id]

  user_data = filebase64("venezuela.sh")

  tags = {
    Name = "venezuela-template"
  }

  lifecycle {
    create_before_destroy = true
  }
}