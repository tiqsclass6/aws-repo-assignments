# # https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance

# # Hungary EC2 Instance
# resource "aws_instance" "ec2" {
#   ami                         = "ami-0484b27e9143d1299"
#   instance_type               = "t3.micro"
#   subnet_id                   = aws_subnet.public-1.id
#   vpc_security_group_ids      = [aws_security_group.web-server.id]
#   associate_public_ip_address = true

#   user_data = file("hungary.sh")

#   depends_on = [aws_security_group.web-server]

#   tags = {
#     Name    = "ec2"
#     service = "amazon-linux"
#   }
# }

# # Japan EC2 Instance
# resource "aws_instance" "ec2" {
#   ami                         = "ami-0167a897f57bcc042"
#   instance_type               = "t3.micro"
#   subnet_id                   = aws_subnet.public-2.id
#   vpc_security_group_ids      = [aws_security_group.web-server.id]
#   associate_public_ip_address = true

#   user_data = file("japan.sh")
#   depends_on = [aws_security_group.web-server]

#   tags = {
#     Name    = "ec2"
#     service = "amazon-linux"
#   }
# }