resource "aws_security_group" "fib_sg"{
    name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.multi_container_app_vpc.id

  ingress {
    description = "postgres and redis access"
    from_port   = 0
    to_port     = 5432
    protocol    = "tcp"
    self = true
  }
  ingress {
    description = "postgres and redis access"
    from_port   = 0
    to_port     = 6379
    protocol    = "tcp"
    self = true
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "multi_docker_sg"
    Project = "fib"
  }
}