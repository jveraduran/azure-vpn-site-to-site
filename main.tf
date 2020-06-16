# Main Configuration of Azure Resource Groups

# Llamado al Backend a utilizar para el lenguaje de programación de aprovisionamiento de Infra
terraform {
  backend "consul" {}
}

# Llamado a Grupo de Recursos asociado a los nuevos componentes.
data "azurerm_resource_group" "main" {
  name      = ""
}


