# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance

# Japan EC2 Instance
resource "aws_instance" "ec2_japan" {
  ami                         = "ami-094524ca01aa224d2"
  instance_type               = "t3.micro"
  subnet_id                   = aws_subnet.public-1.id
  vpc_security_group_ids      = [aws_security_group.web-server.id]
  associate_public_ip_address = true

  user_data = file("japan.sh")

  depends_on = [aws_security_group.web-server]

  tags = {
    Name    = "ec2_japan"
    service = "amazon-linux"
  }
}