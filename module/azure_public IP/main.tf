resource "azurerm_public_ip" "pub" {
    for_each = var.child-pip
  name                = each.value.name
  location            = each.value.location
  resource_group_name =each.value.resource_group_name
  allocation_method   = each.value.allocation_method
  sku                 = each.value.sku
}