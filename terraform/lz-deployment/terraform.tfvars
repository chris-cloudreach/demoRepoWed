internet = "0.0.0.0/0"
azs                     = ["us-east-1a", "us-east-1b", "us-east-1c"]
public_subnet_cidr      = ["10.106.16.0/26", "10.106.16.64/26", "10.106.16.128/26"]
application_subnet_cidr = ["10.106.16.192/26", "10.106.17.0/26", "10.106.17.64/26"]
data_subnet_cidr        = ["10.106.17.128/25", "10.106.18.0/25", "10.106.18.128/25"]

customer_dc_networks = ["10.0.0.0/8"]

account_name = "DNC"
customer_name = "DNC"
account_id = "123456"
aws_region = "islington"
external_id = "DN"
vpc_cidr = "10.0.0.0/16"
whitelist = ["10.0.0.0/8"]
vpc_name = "dnc_vpc"
