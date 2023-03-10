# Creating EC2 instance one in Public Subnet
resource "aws_instance" "mywebappinstance1" {
  ami                         = "ami-087c17d1fe0178315"
  instance_type               = "t2.micro"
  count                       = 1
  key_name                    = "webappinstancekey"
  vpc_security_group_ids      = [aws_security_group.mywebappsg.id]
  subnet_id                   = aws_subnet.public-subnet-1.id
  associate_public_ip_address = true
  user_data                   = file("data.sh")

  tags = {
    Name = "My webapp Public Instance 1"
  }
}

# Creating EC2 instance two in Public Subnet
resource "aws_instance" "mywebappinstance2" {
  ami                         = "ami-087c17d1fe0178315"
  instance_type               = "t2.micro"
  count                       = 1
  key_name                    = "webappinstancekey"
  vpc_security_group_ids      = [aws_security_group.mywebappsg.id]
  subnet_id                   = aws_subnet.public-subnet-2.id
  associate_public_ip_address = true
  user_data                   = file("data.sh")

  tags = {
    Name = "My webapp Public Instance 2"
  }
}
