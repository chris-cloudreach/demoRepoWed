terraform {
  backend "s3" {
    bucket         = "cloudamize-tfstate-name-region"
    dynamodb_table = "terraform-locking-name"
    encrypt        = true
    key            = "onramp/tfstate"
    region         = var.aws_region
    #role_arn       = "arn:aws:iam::account_id:role/CloudamizeOnramp"
    role_arn    = "arn:aws:iam::" + var.account_id + ":role/CloudamizeOnramp"
    external_id = var.external_id
  }
}
