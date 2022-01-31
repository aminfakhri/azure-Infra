locals {
  common_tags = {
    Name          = "Terraform-Class"
    Project       = "Learning"
    ContactEmail  = "ccgc5502@gmail.com"
    Environmnet   = "Lab"

  }

}
variable "linux_name" {
  default = {

        linux = "lab03s2-db1-u-vm1"
        size = "Standard_B1s"

  }
}


variable "ssh_public_key" {
    default = "/home/amin6010/.ssh/id_rsa.pub"

}

variable "username" {
default = "amin6010"
}

variable "os_disk" {
   type = map(string)

   default = {
        cache = "ReadWrite"
        storage = "Premium_LRS"
        disk_size_gb = "32"
    }
}

variable "source_image" {
    type = map(string)

    default = {
        publisher = "Canonical"
        offer     = "UbuntuServer"
        sku       = "19.04"
        version   = "latest"

     }
}
