variable "environment" {
  default = "Prod"
}
variable "app_name" {
  default = ""
}

variable "whitelist" {
  default = ["10.0.0.0/8"]
}

# variable "password" {
#   sensitive = true
# }
