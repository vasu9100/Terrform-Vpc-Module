output "roboshop_vpc" {
  value = aws_vpc.roboshop_vpc.id
}

output "ig_id" {
  value = aws_internet_gateway.gw.id
}

output "az-names" {
  value = data.aws_availability_zones.available.names
}

output "public_subnet_range" {
  value = aws_subnet.public_subnet[*].id
}

output "private_subnet_range" {
  value = aws_subnet.private_subnet[*].id
}

output "database_subnet_range" {
  value = aws_subnet.database_subnet[*].id
}

output "nat_id" {
  value = aws_nat_gateway.nat_gate.id
}

output "default_vpc" {
  value = data.aws_vpc.default.id
}

output "vpc_peering" {
  value = aws_vpc_peering_connection.vpc_peering[*].id
}

output "default_route" {

  value = data.aws_route_table.default.id

}

output "public_route_table" {
  value = aws_route_table.public_route_table.id

}

output "private_route_table" {
  value = aws_route_table.private_route_table.id

}

output "database_route_table" {
  value = aws_route_table.database_route_table.id

}

