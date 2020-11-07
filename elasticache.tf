resource "aws_elasticache_cluster" "redis" {
  cluster_id           = "multi-docker-fib-redis"
  engine               = "redis"
  node_type            = "cache.t2.micro"
  num_cache_nodes      = 1
  parameter_group_name = "default.redis3.2"
  engine_version       = "3.2.10"
  port                 = 6379
  subnet_group_name = aws_elasticache_subnet_group.redis_subnet_group.name
  security_group_ids = [aws_security_group.fib_sg.id]
  tags = {
    Project = "fib"
  }
}

resource "aws_elasticache_subnet_group" "redis_subnet_group" {
  name       = "redis-cache-subnet"
  subnet_ids = [aws_subnet.multi_container_app_subnet.id]

}
