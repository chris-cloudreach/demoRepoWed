# Terraform version and provider configurations

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}
provider "aws" {
  assume_role {
    role_arn    = "arn:aws:iam::account_id:role/CloudamizeOnramp"
    external_id = "client123"
  }
  region = "us-east-1"

  default_tags {
    tags = {
      DeployedBy     = "Terraform"
      AWS_Deployment = "Cloudreach-onramp"
    }
  }
}
