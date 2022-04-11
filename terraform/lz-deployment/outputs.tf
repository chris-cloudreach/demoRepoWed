output "vpc_id" {
  value = module.vpc.vpc_id
}

output "app_subnets" {
  value = module.vpc.application_subnet_ids
}

output "data_subnets" {
  value = module.vpc.data_subnet_ids
}

output "pub_subnets" {
  value = module.vpc.public_subnet_ids
}

output "ssh_sg" {
  value = module.vpc.ssh_sg
}

output "rdp_sg" {
  value = module.vpc.rdp_sg
}

output "data_rts" {
  value = module.vpc.data_route_table_ids
}

output "endpoint_sg" {
  value = module.vpc.endpoint_sg
}

output "mgn_test_sg_id" {
  value = module.mgn.mgn_test_sg_id
}

output "mgn_access_key" {
  value = module.mgn.mgn_access_key
}

output "mgn_secret_key" {
  value = module.mgn.mgn_secret_key
}
