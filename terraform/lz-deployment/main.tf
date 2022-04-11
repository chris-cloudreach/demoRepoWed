###########################
## Main Landing Zone VPC ##
###########################

module "vpc" {
  ### VPC Launch Config ###
  source                  = "github.com/cloudreach/onramp-automation//modules/vpc"
  aws_region              = var.aws_region
  account_name            = var.account_name
  env                     = "env"
  region_substring        = "use1"
  azs                     = var.azs
  vpc_cidr                = var.vpc_cidr
  internet                = var.internet
  vpc_name                = var.vpc_name
  public_subnet_cidr      = var.public_subnet_cidr
  application_subnet_cidr = var.application_subnet_cidr
  data_subnet_cidr        = var.data_subnet_cidr
  whitelist               = var.whitelist

  ### VPC Endpoints Config ###

  endpoints = {
    s3 = {
      # gateway endpoint
      service         = "s3"
      route_table_ids = module.vpc.data_route_table_ids
      tags            = { Name = "s3-vpc-endpoint" }

    },
    mgn = {
      # interface endpoint
      service            = "mgn"
      tags               = { Name = "mgn-vpc-endpoint" }
      subnet_ids         = module.vpc.data_subnets
      security_group_ids = [module.vpc.endpoint_sg]
    },
    ec2 = {
      # interface endpoint
      service            = "ec2"
      tags               = { Name = "ec2-vpc-endpoint" }
      subnet_ids         = module.vpc.data_subnets
      security_group_ids = [module.vpc.endpoint_sg]
    },
    # dynamodb = {
    #   # gateway endpoint
    #   service         = "dynamodb"
    #   route_table_ids = module.vpc.data_route_table_ids
    #   tags            = { Name = "dynamodb-vpc-endpoint" }
    # },
  }
}

#########################
#####  VPN Connection ###
#########################

# module "vpn" {
#   source               = "github.com/cloudreach/onramp-automation//modules/vpn"
#   customer_name        = var.customer_name
#   vpc_id               = module.vpc.vpc_id
#   route_table_ids      = concat(module.vpc.application_route_table_ids, module.vpc.data_route_table_ids)
#   customer_gw_ip       = "customer_way"
#   customer_dc_networks = var.customer_dc_networks
# }

#########################
###  MGN User ##
#########################

module "mgn" {
  source        = "github.com/cloudreach/onramp-automation//modules/mgn"
  customer_name = var.customer_name
  mgn_user      = "mgn"
  whitelist     = var.whitelist
  vpc_id        = module.vpc.vpc_id
}

#########################
##### Backup Policy  ####
#########################

module "backup_policy" {
  source        = "github.com/cloudreach/onramp-automation//modules/backup_policy"
  customer_name = var.customer_name
  schedule = {
    daily_backup   = "cron(0 05 ? * * *)"
    weekly_backup  = "cron(0 05 ? * SUN *)"
    monthly_backup = "cron(0 05 1 * ? *)"
  }
}

################
#### AUDIT  ####
################

module "audit" {
  source              = "github.com/cloudreach/onramp-automation//modules/audit"
  customer_name       = var.customer_name
  customer_bucket     = "name"
  bucket_date_created = "date"
}

#######################
#### Test instance  ###
#######################

# resource "aws_instance" "test" {
#   ami                         = data.aws_ami.amazn2Linux.id
#   instance_type               = "t3.micro"
#   subnet_id                   = module.vpc.public_subnet_ids[0]
#   vpc_security_group_ids      = [module.vpc.ssh_sg]
#   associate_public_ip_address = true
#   iam_instance_profile        = module.ec2.ssm_profile

#   tags = {
#     Name = "Test-instance"
#   }
# }
