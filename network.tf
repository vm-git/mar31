resource "aws_vpc" "ntier" {
  cidr_block = var.vpc_info.cidr_block
  tags = {
    "Name" = "vmvpc-${terraform.workspace}"
  }
}

resource "aws_subnet" "subnets" {
  count      = length(var.vpc_info.subnets_names)
  cidr_block = cidrsubnet(var.vpc_info.cidr_block, 8, count.index)
  vpc_id     = aws_vpc.ntier.id
  tags = {
    "Name" = "${var.vpc_info.name}-${var.vpc_info.subnets_names[count.index]}"
  }
}

// create bastion nw only in test env
resource "aws_subnet" "bastionnw" {
  count      = terraform.workspace == "test" ? 1 : 0
  vpc_id     = aws_vpc.ntier.id
  cidr_block = "10.10.5.0/24"
}