
      resource "azurerm_virtual_machine" "virtual" {
    for_each = var.child-vm
  name                  = each.value.name
  location              = each.value.location
  resource_group_name   = each.value.resource_group_name
  network_interface_ids = [each.value.network_interface_id]
  vm_size               = each.value.vm_size

 
  storage_image_reference {
    publisher = "Canonical"
    offer     = "ubuntu-22_04-lts"
    sku       = "server"
    version   = "latest"
  }
  storage_os_disk {
    name              = "myosdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "asad"
    admin_username = "assadimam"
    admin_password = "assad@1234"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
  
}