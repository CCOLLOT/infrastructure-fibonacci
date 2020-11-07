resource "aws_db_instance" "postgres_instance" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "postgres"
  engine_version       = "12.3	"
  instance_class       = "db.t2.micro"
  name                 = "multi-docker-postgres"
  username             = var.POSTGRES_USERNAME
  password             = var.POSTGRES_PASSWORD
  parameter_group_name = "default.postgres12"
  identifier_prefix = "multi-docker-postgres"
  backup_retention_period = 0
  vpc_security_group_ids = [aws_security_group.fib_sg.id]
}

