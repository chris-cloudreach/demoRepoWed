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
    role_arn    = "arn:aws:iam::${var.account_id}:role/CloudamizeOnramp"
    external_id = var.external_id
  }
  region = var.aws_region

  default_tags {
    tags = {
      DeployedBy     = "Terraform"
      AWS_Deployment = "Cloudreach-onramp"
    }
  }
}
