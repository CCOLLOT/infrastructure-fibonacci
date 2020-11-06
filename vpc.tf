
resource "aws_vpc" "multi_container_app_vpc" {
  cidr_block       = var.BEANSTALK_VPC_CIDR_BLOCK
  instance_tenancy = "default"
  enable_dns_hostnames = true
  tags = {
    Project = "fib"
    Name = "fib-vpc"
  }
}

resource "aws_subnet" "multi_container_app_subnet" {
  vpc_id     = aws_vpc.multi_container_app_vpc.id
  cidr_block = var.BEANSTALK_SUBNET_CIDR_BLOCK
  map_public_ip_on_launch = true

  tags = {
    Project = "fib"
    Name = "fib-subnet"
  }
}
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.multi_container_app_vpc.id
  tags = {
    Project = "fib"
    Name = "fib-igw"
  }
}
resource "aws_route_table" "r" {
  vpc_id = aws_vpc.multi_container_app_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Project = "fib"
    Name = "fib-routeTable"
  }
}
resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.multi_container_app_subnet.id
  route_table_id = aws_route_table.r.id
}

