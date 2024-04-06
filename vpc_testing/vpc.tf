module "vpc_roboshop" {
  source = "github.com/vasu9100/Terrform-Vpc-Module.git?ref=main"
  cidr_block      = var.cidr_block
  public_subnet   = var.public_subnet
  private_subnet  = var.private_subnet
  database_subnet = var.database_subnet

  is_vpc_peering_required = var.is_vpc_peering_required
  auto_accept             = var.auto_accept

}