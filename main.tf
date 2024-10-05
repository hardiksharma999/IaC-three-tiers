provider "azurerm" {
  features {}
}

# Calling the network module
module "network" {
  source          = "./modules/network"
  vnet_name       = var.vnet_name
  address_space   = var.vnet_address_space
  frontend_subnet = var.frontend_subnet
  backend_subnet  = var.backend_subnet
  db_subnet       = var.db_subnet
}

# Calling the app service module (Frontend)
module "app_service" {
  source              = "./modules/app_service"
  resource_group_name = var.resource_group_name
  app_service_name    = var.app_service_name
  subnet_id           = module.network.frontend_subnet_id
}

# Calling the NSG module
module "nsg" {
  source                  = "./modules/nsg"
  resource_group_name      = var.resource_group_name
  frontend_nsg_name        = var.frontend_nsg_name
  backend_nsg_name         = var.backend_nsg_name
  db_nsg_name              = var.db_nsg_name
  allowed_ips              = var.allowed_ips
  frontend_subnet_id       = module.network.frontend_subnet_id
  backend_subnet_id        = module.network.backend_subnet_id
  db_subnet_id             = module.network.db_subnet_id
}

# Calling the Application Gateway module (with WAF)
module "application_gateway" {
  source                  = "./modules/application_gateway"
  resource_group_name      = var.resource_group_name
  app_gateway_name         = var.app_gateway_name
  subnet_id                = module.network.frontend_subnet_id
  frontend_ip_configuration = module.network.frontend_ip
}

# Calling the Database module
module "database" {
  source                  = "./modules/database"
  resource_group_name      = var.resource_group_name
  db_name                  = var.db_name
  db_subnet_id             = module.network.db_subnet_id
}
