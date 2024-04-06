# Terraform AWS VPC Configuration

This Terraform configuration sets up a Virtual Private Cloud (VPC) on AWS along with associated resources like subnets, internet gateway, NAT gateway, route tables, and route associations.

## Prerequisites

Before running this Terraform configuration, ensure you have:

- An AWS account with appropriate permissions.
- Terraform installed on your local machine.

## Configuration

### Variables

Make sure to define the following variables:

- `cidr_block`: The CIDR block for the VPC.
- `enable_dns_hostname`: Enable DNS hostnames for the VPC.
- `enviornment`: Environment name.
- `application_name`: Name of the application.
- `common_tags`: Common tags to be applied to resources.
- `app`: Application name.
- `vpc_role`: Role of the VPC.
- `ig_role`: Role of the internet gateway.
- `route_role`: Role of the route tables.
- `nat_role`: Role of the NAT gateway.
- `eip_role`: Role of the Elastic IP.
- `public_subnet`: List of CIDR blocks for public subnets.
- `private_subnet`: List of CIDR blocks for private subnets.
- `database_subnet`: List of CIDR blocks for database subnets.
- `ig_gateway_attached`: Specifies if the internet gateway is attached.
- `is_vpc_peering_required`: Specifies if VPC peering is required.
- `peering_vpc_id`: The ID of the VPC for peering.
- `auto_accept`: Automatically accept peering connections.
- `peer_role`: Role of the VPC peering connection.

### Resources

#### VPC

- Creates an AWS VPC with the specified CIDR block.

#### Internet Gateway

- Creates an internet gateway and attaches it to the VPC.

#### Subnets

- Creates public, private, and database subnets within the VPC.

#### Route Tables

- Creates separate route tables for public, private, and database subnets.

#### Elastic IP (EIP)

- Allocates an Elastic IP address for the NAT gateway.

#### NAT Gateway

- Sets up a NAT gateway in a public subnet and associates it with the Elastic IP.

#### Routes

- Defines routes for public, private, and database subnets to route traffic appropriately.

#### Route Table Associations

- Associates the appropriate route tables with their respective subnets.

### Outputs

- `roboshop_vpc`: ID of the created VPC.
- `ig_id`: ID of the created internet gateway.
- `az-names`: List of availability zone names.
- `public_subnet_range`: CIDR blocks of the public subnets.
- `private_subnet_range`: CIDR blocks of the private subnets.
- `database_subnet_range`: CIDR blocks of the database subnets.
- `nat_id`: ID of the created NAT gateway.
- `default_vpc`: ID of the default VPC.
- `vpc_peering`: IDs of the VPC peering connections.
- `default_route`: ID of the default route table.
- `public_route_table`: ID of the public route table.
- `private_route_table`: ID of the private route table.
- `database_route_table`: ID of the database route table.

### Locals

- `vpc_name`: Name of the VPC.
- `ig_name`: Name of the internet gateway.
- `az_names`: List of availability zone names.
- `nat_name`: Name of the NAT gateway.
- `eip_name`: Name of the Elastic IP.
- `public_route_name`: Name of the public route.
- `private_route_name`: Name of the private route.
- `database_route_name`: Name of the database route.
- `peer_name`: Name of the default VPC peering.
- `default_vpc`: ID of the default VPC.
- `default_vpc_cidr_block`: CIDR block of the default VPC.

## Running the Configuration

1. Set up your AWS credentials either by exporting them as environment variables or by using AWS CLI configuration.
2. Initialize Terraform with `terraform init`.
3. Review the execution plan with `terraform plan`.
4. Apply the configuration with `terraform apply`.

## Maintenance

- Ensure that any changes to the configuration are thoroughly reviewed before applying.
- Periodically review and update resource configurations to meet evolving requirements.
- Regularly check for Terraform updates and apply them as necessary.
