terraform {
  backend "s3" {
    bucket         = "cloudamize-tfstate-name-region"
    dynamodb_table = "terraform-locking-name"
    encrypt        = true
    key            = "onramp/app-tfstate"
    region         = "us-east-1"
    role_arn       = "arn:aws:iam::account_id:role/CloudamizeOnramp"
    external_id    = "client123"
  }
}

data "terraform_remote_state" "lz_state" {
  backend = "s3"
  config = {
    bucket         = "cloudamize-tfstate-name-region"
    dynamodb_table = "terraform-locking-name"
    encrypt        = true
    key            = "onramp/tfstate"
    region         = "us-east-1"
    role_arn       = "arn:aws:iam::account_id:role/CloudamizeOnramp"
    external_id    = "client123"
  }
}
