#############################################################################
# TERRAFORM CONFIG
#############################################################################

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}


#############################################################################
# PROVIDERS
#############################################################################

provider "azurerm" {
  features {}
  subscription_id = "95b81430-bc23-49f7-b570-6915975e2760"
}

#############################################################################
# Create Web Azure Virtual Network
#############################################################################

resource "azurerm_virtual_network" "web-vnet" {
  name                = var.vnet_web_name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.vnet_web_address_space

# Create Subnet - Web
  subnet {
    name          = var.snet_web_name
   address_prefixes = ["10.100.0.0/24"]
  }

  tags = {
    team= "web team"
  }
}

#############################################################################
# Create Database Azure Virtual Network
#############################################################################

resource "azurerm_virtual_network" "db-vnet" {
  name                = var.vnet_db_name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.vnet_db_address_space

# Create Subnet - Database
 subnet {
    name           = var.snet_db_name
    address_prefixes = ["10.120.0.0/24"]
  }

  tags = {
    team = "Database team"
  }
}


#############################################################################
# Create Peering of Virtual networks
#############################################################################

resource "azurerm_virtual_network_peering" "peer-web-to-db" {
  name                      = "peer-web-to-db"
  resource_group_name       = var.resource_group_name
  virtual_network_name      = azurerm_virtual_network.web-vnet.name
  remote_virtual_network_id = azurerm_virtual_network.db-vnet.id
}

resource "azurerm_virtual_network_peering" "peer-db-to-web" {
  name                      = "peer-db-to-web"
  resource_group_name       = var.resource_group_name
  virtual_network_name      = azurerm_virtual_network.db-vnet.name
  remote_virtual_network_id = azurerm_virtual_network.web-vnet.id
}
