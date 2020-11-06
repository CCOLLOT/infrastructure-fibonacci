terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "eu-west-1"
}

terraform {
  backend "s3" {
    bucket = "multicontainer-terraform-backend"
    key    = "backend/terraform.tfstate"
    region = "eu-west-1"
  }
}