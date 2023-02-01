resource "azurerm_network_security_group" "private" {
  name                = "nsg-${var.project}-private-${var.environment_name}"
  location            = var.location
  resource_group_name = var.resource_group

  security_rule {
    name                        = "Microsoft.Databricks-workspaces_UseOnly_databricks-worker-to-worker-inbound"
    description			            = "Required for worker nodes communication within a cluster."
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    source_port_range           = "*"
    destination_port_range      = "*"
    protocol			              = "*"
    source_address_prefix       = "VirtualNetwork"
    destination_address_prefix  = "VirtualNetwork"
  }

security_rule {
    name                        = "Microsoft.Databricks-workspaces_UseOnly_databricks-control-plane-to-worker-ssh"
    description			            = "Required for Databricks control plane management of worker nodes."
    priority                    = 101
    direction                   = "Inbound"
    access                      = "Allow"
    source_port_range           = "*"
    destination_port_range      = "22"
    protocol			    		      = "Tcp"
    source_address_prefix       = "AzureDatabricks"
    destination_address_prefix  = "VirtualNetwork"
  }

  security_rule {
    name                        = "Microsoft.Databricks-workspaces_UseOnly_databricks-control-plane-to-worker-proxy"
    description			            = "Required for Databricks control plane communication with worker nodes."
    priority                    = 102
    direction                   = "Inbound"
    access                      = "Allow"
    source_port_range           = "*"
    destination_port_range      = "5557"
    protocol			    		      = "Tcp"
    source_address_prefix       = "AzureDatabricks"
    destination_address_prefix  = "VirtualNetwork"
  }

  security_rule {
    name                        = "Microsoft.Databricks-workspaces_UseOnly_databricks-worker-to-databricks-webapp"
    description			            = "Required for workers communication with Databricks Webapp."
    priority                    = 100
    direction                   = "Outbound"
    access                      = "Allow"
    source_port_range           = "*"
    destination_port_range      = "443"
    protocol			   		        = "Tcp"
    source_address_prefix       = "VirtualNetwork"
    destination_address_prefix  = "AzureDatabricks"
  }

  security_rule {
    name                        = "Microsoft.Databricks-workspaces_UseOnly_databricks-worker-to-sql"
    description			            = "Required for workers communication with Azure SQL services."
    priority                    = 101
    direction                   = "Outbound"
    access                      = "Allow"
    source_port_range           = "*"
    destination_port_range      = "3306"
    protocol			    		      = "Tcp"
    source_address_prefix       = "VirtualNetwork"
    destination_address_prefix  = "Sql"
  }

  security_rule {
    name                       = "Microsoft.Databricks-workspaces_UseOnly_databricks-worker-to-storage"
    description			           = "Required for workers communication with Azure Storage services."
    priority                   = 102
    direction                  = "Outbound"
    access                     = "Allow"
    source_port_range          = "*"
    destination_port_range     = "443"
    protocol			   		       = "Tcp"
    source_address_prefix      = "VirtualNetwork"
    destination_address_prefix = "Storage"
  }


  security_rule {
    name                       = "Microsoft.Databricks-workspaces_UseOnly_databricks-worker-to-worker-outbound"
    description			           = "Required for worker nodes communication within a cluster."
    priority                   = 103
    direction                  = "Outbound"
    access                     = "Allow"
    source_port_range          = "*"
    destination_port_range     = "*"
    protocol			    		     = "*"
    source_address_prefix      = "VirtualNetwork"
    destination_address_prefix = "VirtualNetwork"
  }

  security_rule {
    name                       = "Microsoft.Databricks-workspaces_UseOnly_databricks-worker-to-eventhub"
    description			           = "Required for worker communication with Azure Eventhub services."
    priority                   = 104
    direction                  = "Outbound"
    access                     = "Allow"
    source_port_range          = "*"
    destination_port_range     = "9093"
    protocol			    		     = "Tcp"
    source_address_prefix		   = "VirtualNetwork"
    destination_address_prefix = "EventHub"
  }


  tags = {
    project = var.project
  }
}

resource "azurerm_network_security_group" "public" {
  name                = "nsg-${var.project}-public-${var.environment_name}"
  location            = var.location
  resource_group_name = var.resource_group

  security_rule {
    name                        = "Microsoft.Databricks-workspaces_UseOnly_databricks-worker-to-worker-inbound"
    description			            = "Required for worker nodes communication within a cluster."
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    source_port_range           = "*"
    destination_port_range      = "*"
    protocol			              = "*"
    source_address_prefix       = "VirtualNetwork"
    destination_address_prefix  = "VirtualNetwork"
  }

security_rule {
    name                        = "Microsoft.Databricks-workspaces_UseOnly_databricks-control-plane-to-worker-ssh"
    description			            = "Required for Databricks control plane management of worker nodes."
    priority                    = 101
    direction                   = "Inbound"
    access                      = "Allow"
    source_port_range           = "*"
    destination_port_range      = "22"
    protocol			    		      = "Tcp"
    source_address_prefix       = "AzureDatabricks"
    destination_address_prefix  = "VirtualNetwork"
  }

  security_rule {
    name                        = "Microsoft.Databricks-workspaces_UseOnly_databricks-control-plane-to-worker-proxy"
    description			            = "Required for Databricks control plane communication with worker nodes."
    priority                    = 102
    direction                   = "Inbound"
    access                      = "Allow"
    source_port_range           = "*"
    destination_port_range      = "5557"
    protocol			    		      = "Tcp"
    source_address_prefix       = "AzureDatabricks"
    destination_address_prefix  = "VirtualNetwork"
  }

  security_rule {
    name                        = "Microsoft.Databricks-workspaces_UseOnly_databricks-worker-to-databricks-webapp"
    description			            = "Required for workers communication with Databricks Webapp."
    priority                    = 100
    direction                   = "Outbound"
    access                      = "Allow"
    source_port_range           = "*"
    destination_port_range      = "443"
    protocol			   		        = "Tcp"
    source_address_prefix       = "VirtualNetwork"
    destination_address_prefix  = "AzureDatabricks"
  }

  security_rule {
    name                        = "Microsoft.Databricks-workspaces_UseOnly_databricks-worker-to-sql"
    description			            = "Required for workers communication with Azure SQL services."
    priority                    = 101
    direction                   = "Outbound"
    access                      = "Allow"
    source_port_range           = "*"
    destination_port_range      = "3306"
    protocol			    		      = "Tcp"
    source_address_prefix       = "VirtualNetwork"
    destination_address_prefix  = "Sql"
  }

  security_rule {
    name                       = "Microsoft.Databricks-workspaces_UseOnly_databricks-worker-to-storage"
    description			           = "Required for workers communication with Azure Storage services."
    priority                   = 102
    direction                  = "Outbound"
    access                     = "Allow"
    source_port_range          = "*"
    destination_port_range     = "443"
    protocol			   		       = "Tcp"
    source_address_prefix      = "VirtualNetwork"
    destination_address_prefix = "Storage"
  }


  security_rule {
    name                       = "Microsoft.Databricks-workspaces_UseOnly_databricks-worker-to-worker-outbound"
    description			           = "Required for worker nodes communication within a cluster."
    priority                   = 103
    direction                  = "Outbound"
    access                     = "Allow"
    source_port_range          = "*"
    destination_port_range     = "*"
    protocol			    		     = "*"
    source_address_prefix      = "VirtualNetwork"
    destination_address_prefix = "VirtualNetwork"
  }

  security_rule {
    name                       = "Microsoft.Databricks-workspaces_UseOnly_databricks-worker-to-eventhub"
    description			           = "Required for worker communication with Azure Eventhub services."
    priority                   = 104
    direction                  = "Outbound"
    access                     = "Allow"
    source_port_range          = "*"
    destination_port_range     = "9093"
    protocol			    		     = "Tcp"
    source_address_prefix		   = "VirtualNetwork"
    destination_address_prefix = "EventHub"
  }
 
  tags = {
    project = var.project
  }
}

resource "azurerm_subnet_network_security_group_association" "private" {
   subnet_id                 = var.private_subnet_id
   network_security_group_id = azurerm_network_security_group.private.id
}

resource "azurerm_subnet_network_security_group_association" "public" {
   subnet_id                 = var.public_subnet_id
   network_security_group_id = azurerm_network_security_group.public.id
}