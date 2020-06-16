# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [Released]

## [1.0.0] - 2020-06-16

- **Adding vpn-site-to-site.tf**: Adding complete File to enable VPN Site to Site on Azure, validated with Fortinet 1000d.

- **Adding virtual-network.tf**: Including Virtual Network Configuration on Azure, to setting up resources to connect around the VPN.

For all this configuration, we used [Hasicorp Consul](https://www.consul.io/docs) as Backend to Environment Configuration.

For Terraform we used [Terraform Provider](https://github.com/terraform-providers/terraform-provider-azurerm/blob/master/CHANGELOG-v1.md#1360-october-29-2019) instead for Drone Pipelines.