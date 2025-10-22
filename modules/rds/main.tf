resource "aws_db_subnet_group" "mysql_subnet_group" {
  name       = "mysql-subnet-group"
  subnet_ids = var.private_subnets
  tags = { Name = "mysql-subnet-group" }
}

resource "aws_db_instance" "mysql" {
  identifier             = "mysql"
  allocated_storage      = 20
  engine                 = "mysql"
  engine_version         = "8.0"
  instance_class         = "db.t3.micro"
  username               = var.username
  password               = var.password
  db_subnet_group_name   = aws_db_subnet_group.mysql_subnet_group.name
  vpc_security_group_ids = var.sg_ids
  skip_final_snapshot    = true
  publicly_accessible    = false
  tags = { Name = "mysql" }
}
