resource "azurerm_mysql_server" "mysql_server" {
  name                = var.db_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku {
    name     = "GP_Gen5_2"
    tier     = "GeneralPurpose"
    capacity = 2
    family   = "Gen5"
  }
  administrator_login          = var.admin_username
  administrator_login_password = var.admin_password
  version                      = "8.0"
  storage_mb                   = 5120
}

resource "azurerm_mysql_database" "mysql_database" {
  name                = var.db_name
  resource_group_name = var.resource_group_name
  server_name         = azurerm_mysql_server.mysql_server.name
  charset             = "utf8"
  collation           = "utf8_unicode_ci"
}
