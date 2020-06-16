# Creación VNET Variables Zona A
resource "azurerm_virtual_network" "main" {
  name                = ""
  location            = "${data.azurerm_resource_group.main.location}"
  resource_group_name = "${data.azurerm_resource_group.main.name}"
  address_space       = [""]
 
 # Suggested Tags
 tags = {
                applicationname         =   ""
                costcenter              =   ""
                deploymenttype          =   "Terraform"
                environmentinfo         =   ""
                notificationdistlist    =   ""
                ownerinfo               =   ""
                sponsorinfo             =   ""
        }
}
resource "azurerm_subnet" "main" {
  name                      = ""
  resource_group_name       = "${data.azurerm_resource_group.main.name}"
  virtual_network_name      = "${azurerm_virtual_network.main.name}"
  address_prefix            = ""
  service_endpoints         = [""]
}