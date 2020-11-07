resource "aws_elastic_beanstalk_application" "multi_container_app" {
  name        = "multi_container_app"
  description = "test_multi_container_app"
  tags = {
    Project = "fib"
  }
}

resource "aws_elastic_beanstalk_environment" "multi_container_bt_environment" {
  name                = "multi-container-bt-environment"
  application         = aws_elastic_beanstalk_application.multi_container_app.name
  solution_stack_name = "64bit Amazon Linux 2018.03 v2.22.1 running Multi-container Docker 19.03.6-ce (Generic)"
  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "SecurityGroups"
    value     = aws_security_group.fib_sg.id
  }
  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "IamInstanceProfile"
    value     = "fib-instance-profile"
  }
  setting {
    namespace = "aws:ec2:vpc"
    name      = "VPCId"
    value     = aws_vpc.multi_container_app_vpc.id
  }

  setting {
    namespace = "aws:ec2:vpc"
    name      = "Subnets"
    value     = aws_subnet.multi_container_app_subnet.id
  }
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "PGPASSWORD"
    value     = var.POSTGRES_PASSWORD
  }
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "PGUSER"
    value     = var.POSTGRES_USERNAME
  }
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "PGDATABASE"
    value     = aws_db_instance.postgres_instance.name
  }
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "PGPORT"
    value     = "5432"
  }
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "PGHOST"
    value     = aws_db_instance.postgres_instance.address
  }
setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "REDIS_HOST"
    value     = aws_elasticache_cluster.redis.cluster_id
  }
setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "REDIS_PORT"
    value     = "6379"
  }

  tags = {
    Project = "fib"
  }
}
