resource "aws_vpc_peering_connection" "vpc_peering" {
  count       = var.is_vpc_peering_required == true ? 1 : 0
  peer_vpc_id = var.peering_vpc_id == "" ? local.default_vpc : var.peering_vpc_id
  vpc_id      = aws_vpc.roboshop_vpc.id
  auto_accept = var.auto_accept
  tags = merge(var.common_tags, {
    Name        = local.peer_name
    App         = var.app
    Role        = var.peer_role
    Environment = var.enviornment

  })

}

resource "aws_route" "acceptor_route" {
  count                     = (var.is_vpc_peering_required == true && var.peering_vpc_id == "") ? 1 : 0
  route_table_id            = data.aws_route_table.default.id
  destination_cidr_block    = var.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.vpc_peering[0].id
}

resource "aws_route" "public_accceptor_route" {
  count                     = (var.is_vpc_peering_required == true && var.peering_vpc_id == "") ? 1 : 0
  route_table_id            = aws_route_table.public_route_table.id
  destination_cidr_block    = local.default_vpc_cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.vpc_peering[0].id
}

resource "aws_route" "private_acceptor_route" {
  count                     = (var.is_vpc_peering_required == true && var.peering_vpc_id == "") ? 1 : 0
  route_table_id            = aws_route_table.private_route_table.id
  destination_cidr_block    = local.default_vpc_cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.vpc_peering[0].id
}

resource "aws_route" "database_cceptor_route" {
  count                     = (var.is_vpc_peering_required == true && var.peering_vpc_id == "") ? 1 : 0
  route_table_id            = aws_route_table.database_route_table.id
  destination_cidr_block    = local.default_vpc_cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.vpc_peering[0].id
}

