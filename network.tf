resource "aws_vpc" "ntier" {
  cidr_block = var.vpc_info.cidr_block
}

