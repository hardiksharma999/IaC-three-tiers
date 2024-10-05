output "frontend_subnet_id" {
  value = module.network.frontend_subnet_id
}

output "backend_subnet_id" {
  value = module.network.backend_subnet_id
}

output "db_subnet_id" {
  value = module.network.db_subnet_id
}

output "app_service_name" {
  value = module.app_service.app_service_name
}

output "application_gateway" {
  value = module.application_gateway.app_gateway_name
}

output "db_name" {
  value = module.database.db_name
}
