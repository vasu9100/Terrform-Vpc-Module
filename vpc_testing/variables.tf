variable "cidr_block" {
  type    = string
  default = "10.0.0.0/16"

}

variable "public_subnet" {
  type    = list(any)
  default = ["10.0.1.0/24", "10.0.2.0/24"]

}

variable "private_subnet" {
  type    = list(any)
  default = ["10.0.11.0/24", "10.0.12.0/24"]

}

variable "database_subnet" {
  type    = list(any)
  default = ["10.0.21.0/24", "10.0.22.0/24"]

}

variable "is_vpc_peering_required" {
  type    = bool
  default = true
}

variable "auto_accept" {
  type    = bool
  default = true

}

variable "peering_vpc_id" {
  type = string
  default = ""
  
}

variable "application_name" {
  type = string
  default = "Roboshop"

  
}

variable "enviornment" {
  type = string
  default = "dev"
  
}
