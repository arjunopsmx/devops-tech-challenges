# Creating RDS Instance
resource "aws_db_subnet_group" "mywebappdbsubnetgroup" {
  name       = "main"
  subnet_ids = [aws_subnet.database-subnet-1.id, aws_subnet.database-subnet-1.id]

  tags = {
    Name = "My webapp DB subnet group"
  }
}

resource "aws_db_instance" "mywebapprds" {
  allocated_storage      = 10
  db_subnet_group_name   = aws_db_subnet_group.mywebappdbsubnetgroup.id
  engine                 = "mysql"
  engine_version         = "8.0.20"
  instance_class         = "db.t2.micro"
  multi_az               = true
  name                   = "mywebappdb"
  username               = var.db_username
  password               = var.db_password
  skip_final_snapshot    = true
  vpc_security_group_ids = [aws_security_group.database-sg.id]
}
