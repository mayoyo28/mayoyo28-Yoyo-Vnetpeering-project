#############################################################################
# VARIABLES
#############################################################################

variable "resource_group_name" {
  type = string
  default = "rg-mawofolajin-training-cc-001"
}

variable "location" {
  type    = string
  default = "eastus"
}

variable "vnet_web_name" {
  type    = string
  default = "vnet-web-cc-001"
}

variable "vnet_db_name" {
  type    = string
  default = "vnet-db-cc-001"
}

variable "snet_web_name" {
  type    = string
  default = "snet-web-cc-001"
}

variable "snet_db_name" {
  type    = string
  default = "snet-db-cc-001"
}

variable "vnet_web_address_space" {
  default = [
    "10.100.0.0/16"
  ]
}

variable "snet_vnet_web_address_space" {
  default = [
    "10.100.0.0/24"
  ]
}

variable "vnet_db_address_space" {
  default = [
    "10.120.0.0/16"
  ]
}

# variable "snet_web_address_space" {
#   type = string
#   default = [
#     "10.100.0.0/24"
#   ]
# }

# variable "snet_db_address_space" {
#   default = [
#     "10.120.0.0/24"
#   ]
# }
