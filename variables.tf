variable "location" {
  default = "East US"
}

variable "vnet_name" {
  default = "rsa_vnet"
}

variable "vnet_address_space" {
  default = "10.0.0.0/16"
}

variable "frontend_subnet" {
  default = "rsa_frontend_subnet"
}

variable "frontend_subnet_address_space" {
  default = "10.0.1.0/24"
}

variable "backend_subnet" {
  default = "rsa_backend_subnet"
}

variable "backend_subnet_address_space" {
  default = "10.0.2.0/24"
}

variable "db_subnet" {
  default = "rsa_db_subnet"
}

variable "db_subnet_address_space" {
  default = "10.0.3.0/24"
}

variable "resource_group_name" {
  default = "rsa_project_rg"
}

variable "app_service_name" {
  default = "rsa_frontend"
}

variable "allowed_ips" {
  type    = list(string)
  default = ["x.x.x.x/32", "y.y.y.y/32"] # Replace with your specific IP addresses.
}

variable "db_name" {
  default = "rsa_database"
}

variable "admin_username" {
  default = "adminuser"
}

variable "admin_password" {
  default = "ComplexPassword123!" # Replace with a secure password.
}
