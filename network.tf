resource "aws_vpc" "ntier" {
  cidr_block = var.vpc_info.cidr_block
}

resource "aws_subnet" "subnets" {
  count=length(var.vpc_info.subnets_names)
  cidr_block = cidrsubnet(var.vpc_info.cidr_block,8,count.index)
  vpc_id = aws_vpc.ntier.id
  tags = {
    "Name" = "${var.vpc_info.name}-${var.vpc_info.subnets_names[count.index]}"
  }
}