# # https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance

# # Sao Paulo EC2 Instance
# resource "aws_instance" "ec2" {
#   ami                         = "ami-02040ca09ead0f460"
#   instance_type               = "t3.micro"
#   subnet_id                   = aws_subnet.public-1.id
#   vpc_security_group_ids      = [aws_security_group.web-server.id]
#   associate_public_ip_address = true

#   user_data = file("venezuela.sh")

#   depends_on = [aws_security_group.web-server]

#   tags = {
#     Name    = "ec2"
#     service = "amazon-linux"
#   }
# }
