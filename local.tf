locals {
  vpc_name               = "${var.application_name}-${var.enviornment}-${var.vpc_name}"
  ig_name                = "${var.application_name}-${var.enviornment}-${var.internetgateway_name}"
  az_names               = slice(data.aws_availability_zones.available.names, 0, 2)
  nat_name               = "${var.application_name}-${var.enviornment}-${var.nat_gateway_name}"
  eip_name               = "${var.application_name}-${var.enviornment}-${var.eip_name}"
  public_route_name      = "${var.application_name}-${var.enviornment}-${var.public_route_name}"
  private_route_name     = "${var.application_name}-${var.enviornment}-${var.private_route_name}"
  database_route_name    = "${var.application_name}-${var.enviornment}-${var.database_route_name}"
  peer_name              = "${var.application_name}-${var.enviornment}-${var.vpc_peering_name}"
  default_vpc            = data.aws_vpc.default.id
  default_vpc_cidr_block = data.aws_vpc.default.cidr_block
}