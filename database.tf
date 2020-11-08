resource "aws_db_instance" "postgres_instance" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "postgres"
  engine_version       = "12.3"
  instance_class       = "db.t2.micro"
  name                 = "fibvaluesdb"
  username             = var.POSTGRES_USERNAME
  password             = var.POSTGRES_PASSWORD
  parameter_group_name = "default.postgres12"
  identifier_prefix = "fibvaluesdb"
  backup_retention_period = 0
  vpc_security_group_ids = [aws_security_group.fib_sg.id]
  db_subnet_group_name = aws_db_subnet_group.postres_subnet.name
  skip_final_snapshot = true
}

resource "aws_db_subnet_group" "postres_subnet" {
  name       = "postres_subnet_group"
  subnet_ids = [aws_subnet.multi_container_app_subnet.id,aws_subnet.multi_container_app_subnet2.id]

  tags = {
    Project = "fib"
  }
}