# Appsec_Webapp_simpledemo
## Description

This Terraform project will deploy an AppSec Virtual Machine (Check Point Infinity Next Gateway) and an Azure WebAPP hosting the Juice Shop project for testing purposes.

## Prerequisites

- API Keys from Check Point portal, related to a Profile of Infinity Next Gateway
- Assumed Knowledge
    - Terraform
    - Azure CLI
    - Reverse Proxy functionality

## Use Cases
This is an specific use case to protect the PaaS Azure WebApp Services with Check Point AppSec solution to show the flexibility of deployments.

## How to use it

1. Clone repository, you will need all the files.
2. Modify tfvars to use your own variable values.

    **NOTE:** The variable webapp_name must be unique, the application URL is generated from this variable.
3. Create a token on portal.checkpoint.com in the Infinity Policy app
4. When the terraform apply ends, you will have 2 new Resource Groups, one of them will contain a Web App enter to it and grab the URL to access Juice Shop.
5. In the assets you can create the same host as the one on the WebApp and select the upstream in the same value. 

    **NOTE:** create it only for HTTP, since you don't own the domain you will be not able to create a SSL Cert and can fail)

6. Modify your hosts file to translate the Web App URL into the Infinity Next Gateway machine's IP
7. Do a super cool demo
8. To tear down run "terraform destroy -auto-approve" and clean all
