# Variables de Consul

variable "consul_base_path" {
  type = "string"
}
provider "azurerm" {
  version = "=1.36.0"
}

resource "random_string" "id_a" {
  length  = 5
  lower   = true
  upper   = false
  number  = false
  special = false
}
data "consul_keys" "input" {
  key {
    name = "resource_group_name"
    path = "${var.consul_base_path}/input/resource_group_name"
  }

  key {
    name = "address_space"
    path = "${var.consul_base_path}/input/address_space"
  }

  key {
    name = "address_prefix_a"
    path = "${var.consul_base_path}/input/address_prefix_a"
  }
  key {
    name = "address_prefix_dmz"
    path = "${var.consul_base_path}/input/address_prefix_dmz"
  }
  key {
    name = "address_prefix_b"
    path = "${var.consul_base_path}/input/address_prefix_b"
  }
  key {
    name = "address_prefix_c"
    path = "${var.consul_base_path}/input/address_prefix_c"
  }
  key {
    name = "environment"
    path = "${var.consul_base_path}/input/environment"
  }

  key {
    name = "vpn_shared_key"
    path = "${var.consul_base_path}/input/vpn_shared_key"
  }

  key {
    name = "local_network_address_space"
    path = "${var.consul_base_path}/input/local_network_address_space"
  }

  key {
    name = "gateway_address"
    path = "${var.consul_base_path}/input/gateway_address"
  }
  key {
    name = "regions"
    path = "${var.consul_base_path}/input/regions"
  }

}