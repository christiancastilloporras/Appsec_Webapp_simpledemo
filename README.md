# Description

This Terraform will deploy an AppSec Virtual Machine (Check Point Infinity Next Gateway) and an Azure WebAPP hosting the Juice Shop project for testing purposes.

# Prerequisites

API Keys from Check Point portal, related to a Profile of Infinity Next Gateway
Assumed Knowledge
    Terraform
    AZ CLI
    Some basis of reverse proxy

You will need to set the file "terraform.tfvars" with the variables need.  To get noted the variable "webapp_name" needs to be unique since is also the URL selected from Azure.

# Use Cases
This is an especific use case to protect PaaS from Azure with AppSec solution to show the flexibility on deployments.

# How to use it

1 - Clone repository, you will need all the files
2 - Modify tfvars to use your own variable values
3 - Create a token on portal.checkpoint.com in the Infinity Policy app
4 - When the terraform apply ends, you will have 2 new Resource Groups, one of them will contain a Web App enter to it and grab the URL to access Juice Shop.
5 - In the assets you can create the same host as the one on the WebApp and select the upstream in the same value (note create it only for HTTP, since you don't own the domain you will be not able to create a SSL Cert and can fail)
6 - Modify your hosts file to translate the Web App URL into the Infinity Next Gateway machine's IP
7 - Do a super cool demo
8 - "terraform destroy -auto-approve" and clean all