## Landing Zone Deployment ##
----------
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 3.51.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_audit"></a> [audit](#module\_audit) | ../modules/audit | n/a |
| <a name="module_backup_pol"></a> [backup\_pol](#module\_backup\_pol) | ../modules/backup_policy | n/a |
| <a name="module_cloud_endure"></a> [cloud\_endure](#module\_cloud\_endure) | ../modules/cloud_endure | n/a |
| <a name="module_iam"></a> [iam](#module\_iam) | ../modules/iam_roles | n/a |
| <a name="module_vpc_ohio"></a> [vpc\_ohio](#module\_vpc\_ohio) | ../modules/vpc | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_ami.amazn2Linux](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami) | data source |
| [aws_ami.win2019](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami) | data source |
| [aws_iam_policy_document.ec2_assume_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_tags"></a> [tags](#input\_tags) | Tags | `map(string)` | <pre>{<br>  "Env": "DevTest"<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_app_subnets"></a> [app\_subnets](#output\_app\_subnets) | n/a |
| <a name="output_c_endure_ak"></a> [c\_endure\_ak](#output\_c\_endure\_ak) | n/a |
| <a name="output_c_endure_sg"></a> [c\_endure\_sg](#output\_c\_endure\_sg) | n/a |
| <a name="output_c_endure_sk"></a> [c\_endure\_sk](#output\_c\_endure\_sk) | n/a |
| <a name="output_data_subnets"></a> [data\_subnets](#output\_data\_subnets) | n/a |
| <a name="output_instance_profile"></a> [instance\_profile](#output\_instance\_profile) | n/a |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | n/a |
