module "azurerm_rg" {
  source = "../../module/azure_resource_group"
  child-rg = var.dev-rg
}
module "azurerm_vnet" {
depends_on = [ module.azurerm_rg ]
  source = "../../module/azure_virtual_network"
  child-vnet = var.dev-vnet
}
module "azurerm_subnet" {
  depends_on = [ module.azurerm_vnet ]
  source ="../../module/azure_subnet_terraform"
  child-subnet = var.dev-subnet
}

module "azurerm_public_ip" {
  depends_on = [ module.azurerm_rg ]
  source = "../../module/azure_public_ip"
  child-pip = var.dev-pip
}

module "azurerm_nsg" {
  depends_on = [ module.azurerm_subnet ]
  source = "../../module/azure_NSG"
  child-nsg = var.dev-nsg
}

module "azurerm_peering" {
  depends_on = [ module.azurerm_nsg]  
  source = "../../module/azure_peering"
  child-peering = var.dev-peering
}
module "azurerm_nic" {
  depends_on = [ module.azurerm_peering ]
  source = "../../module/azure_nic"
  child-nic = var.dev-nic
}
module "azurerm_bastion" {
  depends_on = [ module.azurerm_nic ]
  source = "../../module/azure_bastion"
  child-bastion = var.dev-bastion
}

module "azurerm_vm" {
  depends_on = [ module.azurerm_bastion ]
  source = "../../module/azure_vm"
  child-vm = var.dev-vm
}