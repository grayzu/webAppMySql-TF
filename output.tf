output "webAppUrl" {
  value = "${azurerm_app_service.webAppFrontend.fqdn}"
}

output "databaseName" {
  value = "${azurerm_mysql_database.webAppBackend.name}"
}

output "databaseServerName" {
  value = "${azurerm_mysql_server.webAppBackend.fqdn}"
}

output "appServicePlanName" {
  value = "${azurerm_app_service_plan.webAppFrontend.name}"
}
