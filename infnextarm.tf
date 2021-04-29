resource "azurerm_resource_group" "infnext-GR" {
  name     = var.resource_group_name_infnext
  location = var.location
}

resource "azurerm_template_deployment" "infnext-arm" {
  name                = "InfinityNextGateway"
  resource_group_name = azurerm_resource_group.infnext-GR.name
  deployment_mode     = "Complete"
  depends_on = [ azurerm_resource_group.infnext-GR ]
  template_body = file("${path.module}/appsectemplate.json")
  # these key-value pairs are passed into the ARM Template's `parameters` block
  parameters = {
    "location" = azurerm_resource_group.infnext-GR.location
    "cloudGuardVersion" = "R80.40 - Bring Your Own License"
    "adminPassword" = "${var.admin_password}"
    "authenticationType" = "password"
    "vmName" = "InfNextGW"
    "vmSize" = "${var.vmsize}"
    "virtualNetworkName" = "InfNextvNET"
    "virtualNetworkAddressPrefix" = "10.0.0.0/24"
    "Subnet1Name" = "Frontend"
    "Subnet1Prefix" = "10.0.0.0/28"
    "Subnet1StartAddress" = "10.0.0.5"
    "Subnet2Name" = "Backend"
    "Subnet2Prefix" = "10.0.0.16/28"
    "Subnet2StartAddress" = "10.0.0.21"
    "vnetNewOrExisting" = "new"
    "waapPublicIP" = "yes"
    "inboundSources" = "0.0.0.0/0"
    "installationType" = "waap"
    "waapAgentToken" = "${var.waaptoken}"
  }
}