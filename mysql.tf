resource "azurerm_mysql_server" "webAppBackend" {
  name                              = "${var.siteName}pgserver"
  location                          = "${var.loc}"
  resource_group_name               = "${var.rg}"
  tags                              = "${var.tags}"

  administrator_login               = "${var.administratorLogin}"
  administrator_login_password      = "${var.administratorLoginPassword}"
  version                           = "${var.mysqlVersion}"
  ssl_enforcement                   = "Disabled"
  sku {
      name                          = "${var.databaseSkuName}"
      capacity                      = "${var.databaseDTU}"
      tier                          = "${var.databaseSkuTier}"
      family                        = "${var.databaseSkuFamily}"
  }
  storage_profile {
      storage_mb                    = "${var.databaseSkuSizeMB}"
  }
}

resource "azurerm_mysql_database" "webAppBackend" {
  name                = "${var.siteName}database"
  resource_group_name = "${var.rg}"

  server_name         = "${azurerm_mysql_server.webAppBackend.name}"
  charset             = "utf8"
  collation           = "utf8_unicode_ci"
}