variable "frontend_nsg_name" {}
variable "backend_nsg_name" {}
variable "db_nsg_name" {}
variable "allowed_ips" {
  type = list(string)
}
variable "resource_group_name" {}
variable "location" {}
