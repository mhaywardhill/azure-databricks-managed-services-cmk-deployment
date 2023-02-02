## Project: Deploy Azure Databricks VNET injected workspace using Customer Managed Keys

**Project Description**: This project will deploy a Databricks Workspace within Azure with Databricks File System Customer Managed Keys enabled.

## Project Organization

```
    ├── README.md                               <- README file
    ├── LICENSE                                 <- the LICENSE
    └── terraform                               <- Terraform config files 
        ├── environment        
        │   └── test                            <- test environment folder, holds the Terraform state
        └── modules            
            ├── resource_group                  <- Terraform config file to add resource group for the Databricks workspace and VNET
            ├── keyvault                        <- Terraform config file to add Azure Key Vault
            ├── databricks_ws                   <- Terraform config file to add Databricks Workspace
            ├── securitygroups                  <- Terraform config file to add security groups to the subnets
            └── network                         <- Terraform config file to add VNET for the Databricks injected workspace
     
  
```

## Getting started

####  Setup

Clone the repository locally:
```
git clone https://github.com/mhaywardhill/azure-databricks-managed-services-cmk-deployment.git
```

and go into the repository and navigate to the terraform environment folder:

```
cd  azure-databricks-managed-services-cmk-deployment/terraform/environment/test/
```

#### Set environment variables

The project prefix is used to name all the resources.

```variables
HISTCONTROL=ignoreboth
 export TF_VAR_project_name="<project prefix>"

```

####  Init, Apply, and Plan, to deploy resources using Terraform

Run the Terraform init, plan, and apply commands to deploy the resources to build the Azure infrastructure:

```
./terraform init

./terraform plan

./terraform apply
```