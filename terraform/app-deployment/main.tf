###########################
##### App Module Calls ####
###########################

locals {
  csv_file_contents = file("template.csv")
  csv_data          = csvdecode(local.csv_file_contents)

  # App Servers
  wave1 = { for key, server_info in local.csv_data :
    key => server_info if server_info.startup_group == "1"
  }

  # DB Servers
  wave2 = { for key, server_info in local.csv_data :
    key => server_info if server_info.startup_group == "2"
  }

  # File Server
  wave3 = { for key, server_info in local.csv_data :
    key => server_info if server_info.startup_group == "3"
  }
}

## Rehost-Image

module "wave1" {
  source                      = "github.com/cloudreach/onramp-automation//modules/rehost_image"
  for_each                    = { for index, server_info in local.wave1 : index => server_info }
  server                      = each.value
  app_sg_id                   = data.terraform_remote_state.lz_state.mgn_test_sg_id
  read_amis_from_mgn_instance = false
  migration_status            = "Test"
}

module "wave2" {
  source                      = "github.com/cloudreach/onramp-automation//modules/rehost_image"
  for_each                    = { for index, server_info in local.wave2 : index => server_info }
  server                      = each.value
  app_sg_id                   = aws_security_group.db.id
  read_amis_from_mgn_instance = false
  migration_status            = "Test"
}

module "wave3" {
  source                      = "github.com/cloudreach/onramp-automation//modules/rehost_image"
  for_each                    = { for index, server_info in local.wave3 : index => server_info }
  server                      = each.value
  app_sg_id                   = aws_security_group.file.id
  read_amis_from_mgn_instance = false
  migration_status            = "Test"
}

## Rehost-Reinstall

# module "wave3" {
#   source         = "github.com/cloudreach/onramp-automation//modules/rehost_reinstall"
#   for_each       = { for index, server_info in local.wave3 : index => server_info }
#   server         = each.value
#   windows_ami    = true
#   api_protection = true
#   volume_mappings = [
#   { device_name : "xvdh", ebs_size : "100", ebs_type : "gp3" }]
# }
