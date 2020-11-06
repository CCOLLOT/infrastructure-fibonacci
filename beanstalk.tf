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
  tags = {
    Project = "fib"
  }
}
