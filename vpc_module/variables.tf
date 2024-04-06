variable "cidr_block" {
  type    = string
  default = "10.0.0.0/16"
}

variable "enable_dns_hostname" {
  type    = bool
  default = true
}

variable "enviornment" {
  type    = string
  default = "dev"
}

variable "application_name" {
  type    = string
  default = "Roboshop"
}

variable "common_tags" {
  type = map(string)
  default = {
    "BusinessUnit" = "Roboshop"
    "Owner"        = "Srinivas_Gonepudi"
    "Provisioner"  = "Terraform"
  }

}

variable "app" {
  type    = string
  default = "Roboshop"
}

variable "vpc_role" {
  type    = string
  default = "Public-Router"

}



variable "ig_role" {
  type    = string
  default = "Networking"

}

variable "route_role" {
  type    = string
  default = "routing"

}

variable "nat_role" {
  type    = string
  default = "private-Router"

}

variable "eip_role" {
  type    = string
  default = "NAT-PUBLIC-IP"

}



variable "public_subnet" {
  type = list(string)

  validation {
    condition     = length(var.public_subnet) <= 2
    error_message = "Please enter atlease One Public Subnet CIDR Range"
  }
}

variable "private_subnet" {
  type = list(string)

  validation {
    condition     = length(var.private_subnet) <= 2
    error_message = "Please enter Atleast One Private Subnet CIDR Range"
  }

}

variable "database_subnet" {
  type = list(string)
  validation {
    condition     = length(var.database_subnet) <= 2
    error_message = "Please enter Atleast One Private Subnet CIDR Range"
  }
}

variable "ig_gateway_attached" {
  type    = bool
  default = true

}

variable "is_vpc_peering_required" {
  type    = bool
  default = false

}

variable "peering_vpc_id" {
  type    = string
  default = ""

}

variable "auto_accept" {
  type    = bool
  default = false

}

variable "peer_role" {
  type    = string
  default = "peering-coonection"

}