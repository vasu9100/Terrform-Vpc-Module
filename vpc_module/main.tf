resource "aws_vpc" "roboshop_vpc" {
  cidr_block = var.cidr_block

  tags = merge(var.common_tags, {
    Name        = local.vpc_name
    App         = var.app
    Role        = var.vpc_role
    Environment = var.enviornment

  })
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.roboshop_vpc.id

  tags = merge(var.common_tags, {
    Name        = local.ig_name
    App         = var.app
    Role        = var.ig_role
    Environment = var.enviornment

  })
}

resource "aws_subnet" "public_subnet" {
  count             = length(var.public_subnet)
  vpc_id            = aws_vpc.roboshop_vpc.id
  cidr_block        = var.public_subnet[count.index]
  availability_zone = local.az_names[count.index]

  tags = merge(var.common_tags, {
    Name        = "${var.application_name}-${var.enviornment}-public-${local.az_names[count.index]}"
    App         = var.app
    Role        = var.vpc_role
    Environment = var.enviornment

  })
}

resource "aws_subnet" "private_subnet" {
  count             = length(var.private_subnet)
  vpc_id            = aws_vpc.roboshop_vpc.id
  cidr_block        = var.private_subnet[count.index]
  availability_zone = local.az_names[count.index]
  tags = merge(var.common_tags, {
    Name        = "${var.application_name}-${var.enviornment}-private-${local.az_names[count.index]}"
    App         = var.app
    Role        = var.vpc_role
    Environment = var.enviornment

  })


}

resource "aws_subnet" "database_subnet" {
  count             = length(var.database_subnet)
  vpc_id            = aws_vpc.roboshop_vpc.id
  cidr_block        = var.database_subnet[count.index]
  availability_zone = local.az_names[count.index]
  tags = merge(var.common_tags, {
    Name        = "${var.application_name}-${var.enviornment}-database-${local.az_names[count.index]}"
    App         = var.app
    Role        = var.vpc_role
    Environment = var.enviornment

  })


}

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.roboshop_vpc.id

  tags = merge(var.common_tags, {
    Name        = local.public_route_name
    App         = var.app
    Role        = var.route_role
    Environment = var.enviornment

  })
}

resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.roboshop_vpc.id

  tags = merge(var.common_tags, {
    Name        = local.private_route_name
    App         = var.app
    Role        = var.route_role
    Environment = var.enviornment

  })
}

resource "aws_route_table" "database_route_table" {
  vpc_id = aws_vpc.roboshop_vpc.id

  tags = merge(var.common_tags, {
    Name        = local.database_route_name
    App         = var.app
    Role        = var.route_role
    Environment = var.enviornment

  })
}

resource "aws_eip" "eip" {
  domain     = "vpc"
  depends_on = [aws_internet_gateway.gw]
  tags = merge(var.common_tags, {
    Name        = local.eip_name
    App         = var.app
    Role        = var.eip_role
    Environment = var.enviornment

  })

}

resource "aws_nat_gateway" "nat_gate" {
  allocation_id = aws_eip.eip.id
  subnet_id     = aws_subnet.public_subnet[0].id

  tags = merge(var.common_tags, {
    Name        = local.nat_name
    App         = var.app
    Role        = var.nat_role
    Environment = var.enviornment

  })

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.gw]
}

resource "aws_route" "public_route" {
  route_table_id         = aws_route_table.public_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.gw.id

}

resource "aws_route" "private_route" {
  route_table_id         = aws_route_table.private_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat_gate.id

}

resource "aws_route" "database_route" {
  route_table_id         = aws_route_table.database_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat_gate.id

}

resource "aws_route_table_association" "public_route_association" {
  count          = length(var.public_subnet)
  subnet_id      = aws_subnet.public_subnet[count.index].id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "private_route_association" {
  count          = length(var.private_subnet)
  subnet_id      = aws_subnet.private_subnet[count.index].id
  route_table_id = aws_route_table.private_route_table.id
}

resource "aws_route_table_association" "database_route_association" {
  count          = length(var.database_subnet)
  subnet_id      = aws_subnet.database_subnet[count.index].id
  route_table_id = aws_route_table.database_route_table.id
}