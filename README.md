Description
This Terraform will deploy an AppSec Virtual Machine (Check Point Infinity Next Gateway) and an Azure WebAPP hosting the Juice Shop project for testing purposes.

Prerequisites
API Keys from Check Point portal, related to a Profile of Infinity Next Gateway
Assumed Knowledge
    Terraform
    AZ CLI
    Some basis of reverse proxy

You will need to set the file "terraform.tfvars" with the variables need.  To get noted the variable "webapp_name" needs to be unique since is also the URL selected from Azure.

Use Cases
This is an especific use case to protect PaaS from Azure with AppSec solution to show the flexibility on deployments.