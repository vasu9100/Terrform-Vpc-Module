locals {
  vpc_name               = "${var.application_name}-${var.enviornment}-vpc"
  ig_name                = "${var.application_name}-${var.enviornment}-internetgateway"
  az_names               = slice(data.aws_availability_zones.available.names, 0, 2)
  nat_name               = "${var.application_name}-${var.enviornment}-nat-gateway"
  eip_name               = "${var.application_name}-${var.enviornment}-elastic-ip"
  public_route_name      = "${var.application_name}-${var.enviornment}-public-route"
  private_route_name     = "${var.application_name}-${var.enviornment}-private-route"
  database_route_name    = "${var.application_name}-${var.enviornment}-database-route"
  peer_name              = "${var.application_name}-${var.enviornment}-default-vpc-peering"
  default_vpc            = data.aws_vpc.default.id
  default_vpc_cidr_block = data.aws_vpc.default.cidr_block
}