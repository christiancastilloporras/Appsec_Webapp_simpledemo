//********************** General Variables **************************//

variable "location" {
  description = "The location/region where resources will be created. The full list of Azure regions can be found at https://azure.microsoft.com/regions"
  type = string
}

//********************** WebApp Variables **************************//

variable "resource_group_name_webapp" {
  description = "Azure Resource Group name to build into"
  type = string
}

variable "webapp_name" {
  description = "WebApp name, this should be something really unique since is used also for the URL of the WebApp"
  type = string
}

//********************** InfNextGW Instances Variables **************************//

variable "resource_group_name_infnext" {
  description = "Azure Resource Group name to build into"
  type = string
}

variable "admin_password" {
  description = "Administrator password of deployed Virtual Macine. The password must meet the complexity requirements of Azure"
  default = "xxxxxxx"
}

variable vmsize {
    description = "Set the machine size"
    default = "Standard_DS2_v2"
}

variable waaptoken {
    description = "token from the Check Point Portal"
    default = "xxxxxxxxxxxxxx"
}