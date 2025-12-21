# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/launch_template

# Hungary Launch Template (Port 80 - HTTP)
resource "aws_launch_template" "hungary-template" {
  name_prefix   = "hungary-template"
  description   = "hungary-template"
  image_id      = "ami-068c0051b15cdb816"
  instance_type = "t3.micro"
  # key_name    = "basiclinux"

  vpc_security_group_ids = [aws_security_group.web-server.id]

  user_data = filebase64("hungary.sh")

  tags = {
    Name = "hungary-template"
  }

  lifecycle {
    create_before_destroy = true
  }
}

# Japan Launch Template (Port 80 - HTTP)
resource "aws_launch_template" "japan-template" {
  name_prefix   = "japan-template"
  description   = "japan-template"
  image_id      = "ami-068c0051b15cdb816"
  instance_type = "t3.micro"
  # key_name    = "basiclinux"

  vpc_security_group_ids = [aws_security_group.web-server.id]

  user_data = filebase64("japan.sh")

  tags = {
    Name = "japan-template"
  }

  lifecycle {
    create_before_destroy = true
  }
}