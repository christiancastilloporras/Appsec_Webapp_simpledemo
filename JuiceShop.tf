# Create a Resource Group
resource "azurerm_resource_group" "juiceshop-rg" {
  name     = var.resource_group_name_webapp
  location = var.location
}
# Create a Service Plan
resource "azurerm_app_service_plan" "service-plan" {
  name                = "juice-service-plan"
  location            = azurerm_resource_group.juiceshop-rg.location
  resource_group_name = azurerm_resource_group.juiceshop-rg.name
  kind                = "Linux"
  reserved            = true
  sku {
    tier = "Standard"
    size = "S1"
  }
}
# Create a Web App
resource "azurerm_app_service" "juiceshop-app" {
  name                = var.webapp_name
  location            = azurerm_resource_group.juiceshop-rg.location
  resource_group_name = azurerm_resource_group.juiceshop-rg.name
  app_service_plan_id = azurerm_app_service_plan.service-plan.id
  app_settings = {
    WEBSITES_ENABLE_APP_SERVICE_STORAGE = "false"

    /*
    # Settings for private Container Registires  
    DOCKER_REGISTRY_SERVER_URL      = ""
    DOCKER_REGISTRY_SERVER_USERNAME = ""
    DOCKER_REGISTRY_SERVER_PASSWORD = ""
    */
  }
  site_config {
    linux_fx_version = "DOCKER|bkimminich/juice-shop:latest"
    always_on        = "true"
  }
}