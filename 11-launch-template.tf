resource "aws_launch_template" "panama-template" {
  name_prefix   = "panama-template"
  description   = "panama-template"
  image_id      = "ami-02040ca09ead0f460"
  instance_type = "t3.micro"
  # key_name      = "basiclinux"

  vpc_security_group_ids = [aws_security_group.tiqs-public-sg.id]

  user_data = filebase64("panama.sh")

  tags = {
    Name = "panama-template"
  }

  lifecycle {
    create_before_destroy = true
  }
}