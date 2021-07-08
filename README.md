# Project Name: Oracle-web-app-HA

## Overview

This project is related to a web application based on Flask. 
Flask is a popular Python framework for developing web applications quickly and easily.

The whole architecture is a Flask application that interacts with an Oracle Autonomous Database as backend. 

The application is containerized using Docker, and deployed to Oracle Cloud Infrastructure.

The application is presented in different architectures representing the different HA architectures we can deploy on Oracle Cloud Infrastructure. More in details, they are:
-   HA within a single availability domain (exploiting different fault domains). For further details, please look [Oracle-web-app-HA-single-ad](oracle-web-app-ha-single-ad/README.md)
-   HA within a single region (exploiting different availability domains). For further details, please look [Oracle-web-app-HA-multi-ad](oracle-web-app-ha-multi-ad/README.md)
-   HA exploiting multiple regions. For further details, please look [Oracle-web-app-HA-multi-regions](oracle-web-app-ha-multi-regions/README.md)

## Deploy Using Terraform

### Clone this repository

1. You can clone the repository with the following commands:

```
git clone https://github.com/innocenzoLagonigro/cloud-platform-project.git
cd cloud-platform-project
```

2. Based on the architecture you want to deploy, enter in the corresponding sub-directory (e.g. Oracle-web-app-HA-multi-ad) 

```
cd oracle-web-app-ha-multi-ad
```

3. Create a ```terraform.tfvars``` file, and specify the following variables:

```
# Authentication
tenancy_ocid         = "<tenancy_ocid>"
user_ocid            = "<user_ocid>"
fingerprint          = "<fingerprint>"
private_key_path     = "<pem_private_key_path>"

# SSH Keys
ssh_public_key  = "<public_ssh_key_path>"
ssh_private_key  = "<private_ssh_key_path>"

# database
ATP_password           = "<ATP_user_password>"
ATP_data_guard_enabled = false # set the value to true only when you want to enable standby and then re-run terraform apply
ATP_auto_scaling_enabled = true

# Region
region = "eu-frankfurt-1"

# Compartment
compartment_ocid = "<compartment_ocid>"

# Networking

vcn_cidr = "<vcn_cidr>"
vcn_dns_label = "<vcn_dns_label>"
vcn_name = "<vcn_name>"

lb_subnet_cidr = "<lb_subnet_cidr>"
web_app_subnet_cidr = "<web_app_subnet_cidr>"
db_subnet_cidr = "<db_subnet_cidr>"
```
