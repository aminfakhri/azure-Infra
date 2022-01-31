variable "rg_name"  {
default = "lab03-rg2"
}

variable "location" {
default = "canadaeast"
}

variable "vnet" {
default = "network-vnet"

}
variable "vnet_space" {
default = ["10.0.0.0/16"]
}

variable "subnet1" {
  default = "network-subnet1"
}

variable "subnet2" {
   default = "network-subnet2"
}

variable "subnet3" {
   default = "network-subnet3"
}
variable "subnet1-space" {
  default = ["10.0.1.0/24"]
}

variable "subnet2-space" {
   default = ["10.0.2.0/24"]
}

variable "subnet3-space" {
   default = ["10.0.3.0/24"]
}

variable "security-group1" {
   default = "lab03-nsg1"

}

variable "security-group2" {
   default = "lab03-nsg2"
  }
