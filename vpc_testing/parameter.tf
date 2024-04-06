resource "aws_ssm_parameter" "vpc_id" {
    name = "/${var.application_name}/${var.enviornment}/vpc_id"
    type = "String"
    value = module.vpc_roboshop.roboshop_vpc
}

