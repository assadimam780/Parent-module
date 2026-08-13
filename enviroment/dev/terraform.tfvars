dev-rg = {
  rg1 = {
        name = "imam"
        location = "westus2"
    }
}

dev-vnet = { 
        vnet2 = {
    name                   = "dev-vnet2"
    location               = "westus2"
    azurerm_resource_group = "imam"
    address_space          = ["10.1.0.0/16"]
  } 
    }

    dev-subnet = {
        sub1 = {
    name                   = "dev-subnet"
    resource_group_name    = "imam"
    virtual_network_name   = "dev-vnet2"
    address_prefixes       = ["10.1.1.0/24"]
  }
    }

    dev-pip = {
  ip = {
    name                = "pip"
    location            = "westus2"
    resource_group_name = "imam"
    allocation_method   = "Static"
    sku                 = "Standard"
  }
 }

 dev-peering={
    "rg04" = {
        name                      = "front"
        resource_group_name       = "imam"
        virtual_network_name      = "front-network1"
        remote_virtual_network_id = "/subscriptions/d916b3cf-5974-4441-8d1b-3a86fabd1d40/resourceGroups/assad/providers/Microsoft.Network/virtualNetworks/example-network1"
}

}

dev-nsg = {
    "nsg1" = {
        name                = "nsg1"
        location            = "centralus"
        resource_group_name = "assad"
    
        security_rule = {
        name               = "assad1"
        priority           = 100
        direction          = "Inbound"
        access             = "Allow"
        protocol           = "Tcp"
        source_port_range  = "*"
        }
    }
    }

    dev-nic ={
    "nic1" = {
        name                = "UAE_nic"
        location            = "centralus"
        resource_group_name = "assad"
        subnet_id           = "/subscriptions/d916b3cf-5974-4441-8d1b-3a86fabd1d40/resourceGroups/assad/providers/Microsoft.Network/virtualNetworks/example-network1/subnets/rg02-subnet"
        public_ip_address_id = "/subscriptions/d916b3cf-5974-4441-8d1b-3a86fabd1d40/resourceGroups/assad/providers/Microsoft.Network/publicIPAddresses/rg03"
    }
}

dev-bastion = {
  bast1 = {
    name                 = "bastion12"
    location             = "centralus"
    resource_group_name  = "assad"
    subnet_id            = "/subscriptions/d916b3cf-5974-4441-8d1b-3a86fabd1d40/resourceGroups/assad/providers/Microsoft.Network/publicIPAddresses/pip-example-network1-centralus-rg02-subnet"
    public_ip_address_id = "/subscriptions/d916b3cf-5974-4441-8d1b-3a86fabd1d40/resourceGroups/assad/providers/Microsoft.Network/publicIPAddresses/rg03"
  }
}
dev-vm = {
    vm2 = {
        name                  = "myVM1"
        location              = "centralus"
        resource_group_name   = "assad"
        network_interface_id  = "/subscriptions/d916b3cf-5974-4441-8d1b-3a86fabd1d40/resourceGroups/assad/providers/Microsoft.Network/networkInterfaces/UAE_nic"
        vm_size               = "Standard_D2s_v3"
    }
  
}
