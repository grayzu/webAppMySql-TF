resource "azurerm_app_service_plan" "webAppFrontend" {
  name                = "${var.siteName}serviceplan"
  resource_group_name = "${var.rg}"
  location            = "${var.loc}"
  tags                = "${var.tags}"

  sku {
    tier = "${var.servicePlanTier}"
    size = "${var.servicePlanSize}"
  }
}

resource "azurerm_app_service" "webAppFrontend" {
  name                = "${var.siteName}"
  location            = "${var.loc}"
  resource_group_name = "${var.rg}"
  tags                = "${var.tags}"

  app_service_plan_id = "${azurerm_app_service_plan.webAppFrontend.id}"
  connection_string {
    name  = "DefaultConnect"
    type  = "MySql"
    value = "Database=${azurerm_mysql_database.webAppBackend.name};Data Source=${azurerm_mysql_server.webAppBackend.fqdn};User Id=${var.administratorLogin}@${azurerm_mysql_server.webAppBackend.name};Password=${var.administratorLoginPassword}"
  }
}