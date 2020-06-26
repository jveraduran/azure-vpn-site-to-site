 ## VPN Site to Site With definitive variables

## VPN Site to Site
resource "azurerm_subnet" "gateway-subnet" {
  name                 = ""
  resource_group_name  = "${data.azurerm_resource_group.main.name}"
  virtual_network_name = "${azurerm_virtual_network.main.name}"
  address_prefix       = "${cidrsubnet(azurerm_virtual_network.main.address_space[0], 10, 0)}"
}

## Creación de IP Pública 
resource "azurerm_public_ip" "vpn-on-premise" {
  name                         = "" # Nombre de IP Pública
  location                     = "${data.azurerm_resource_group.main.location}" # Zona del Grupo de Recursos
  resource_group_name          = "${data.azurerm_resource_group.main.name}" # Nombre del Grupo de Recursos
  public_ip_address_allocation = "dynamic"
}

## Creación de Local Network Gateway
resource "azurerm_local_network_gateway" "on-premise" {
  name                = "" # Nombre de Local Network Gateway
  location            = "${data.azurerm_resource_group.main.location}" # Zona del Grupo de Recursos
  resource_group_name = "${data.azurerm_resource_group.main.name}" # Nombre del Grupo de Recursos
  gateway_address     = "" # IP de Conexion con Red Local
  address_space       = [""] # Lista de Segmentos On-Premise
}

## Creación de Virtual Network Gateway
resource "azurerm_virtual_network_gateway" "vpn-on-premise" {
  name                = "" # Nombre de Virtual Network Gateway
  location            = "${data.azurerm_resource_group.main.location}" # Zona del Grupo de Recursos
  resource_group_name = "${data.azurerm_resource_group.main.name}" # Nombre del Grupo de Recursos

  type     = "Vpn"
  vpn_type = "RouteBased"

  active_active = false
  enable_bgp    = false
  sku           = "Standard"

  ip_configuration {
    public_ip_address_id          = "${azurerm_public_ip.vpn-on-premise.id}"
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = "${azurerm_subnet.gateway-subnet.id}"
  }
}
## Creación de Virtual Network Gateway Connection
resource "azurerm_virtual_network_gateway_connection" "on-premise" {
  name                = ""
  location            = "${data.azurerm_resource_group.main.location}" # Zona del Grupo de Recursos
  resource_group_name = "${data.azurerm_resource_group.main.name}" # Nombre del Grupo de Recursos

  type                       = "IPsec"
  virtual_network_gateway_id = "${azurerm_virtual_network_gateway.vpn-on-premise.id}"
  local_network_gateway_id   = "${azurerm_local_network_gateway.on-premise.id}"
  shared_key = ""

  ipsec_policy {
    dh_group         = "DHGroup2"
    ike_encryption   = "AES256"
    ike_integrity    = "SHA256"
    ipsec_encryption = "AES256"
    ipsec_integrity  = "SHA256"
    pfs_group        = "None"
    sa_datasize      = "102400000"
    sa_lifetime      = "27000"
  }

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