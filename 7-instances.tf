# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance

# Sao Paulo EC2 Instance
resource "aws_instance" "tiqs-ec2-instance" {
  ami                         = "ami-02040ca09ead0f460"
  instance_type               = "t3.micro"
  subnet_id                   = aws_subnet.tiqs-public-1.id
  vpc_security_group_ids      = [aws_security_group.tiqs-public-sg.id]
  associate_public_ip_address = true

  user_data = file("brazil.sh")

  depends_on = [aws_security_group.tiqs-public-sg]

  tags = {
    Name    = "tiqs-ec2-instance"
    service = "amazon-linux"
  }
}
