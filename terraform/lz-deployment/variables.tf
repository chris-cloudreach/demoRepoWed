variable "tags" {
  type        = map(string)
  default     = { "Env" : "DevTest" }
  description = "Tags"
}

# Customer details
variable "customer_name" {
  description = "Customer name"
  type        = string
}
variable "external_id" {
  description = "AssumeRole external id"
  type        = string
}
variable "account_id" {
  description = "Aws account id of customer"
  type        = string
}
variable "account_name" {
  description = "Customer account name"
  type        = string
}
variable "customer_dc_networks" {
  description = "customer_dc_networks"
  type        = string
}

# VPC, AZ & Subnet CIDR details
variable "azs" {
  type    = list(any)
  default = ["us-east-1a", "us-east-1b", "us-east-1c"]
}
variable "public_subnet_cidr" {
  type        = list(any)
  description = "Public subnets tier CIDR"
}
variable "application_subnet_cidr" {
  type        = list(any)
  description = "Application subnets tier CIDR"
}
variable "data_subnet_cidr" {
  type        = list(any)
  description = "Database subnets tier CIDR"
}
variable "whitelist" {
  description = "Whitelist CIDR"
  type        = string
}
variable "vpc_cidr" {
  description = "VPC CIDR"
  type        = string
}
variable "vpc_name" {
  description = "Name of VPC"
  type        = string
}
variable "aws_region" {
  description = "AWS region"
  type        = string
}

# Reaching internet
variable "internet" {
  description = "CIDR for reaching the world/internet"
  type        = string
}
