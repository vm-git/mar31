variable "vpc_info" {
  type=object({
    name=string
    cidr_block=string
    subnets_cidrs=list(string)
    subnets_names=list(string)
  })
  default = {
    name="vpc1"
    cidr_block = "192.168.0.0/16"
    subnets_names=["dev1","dev2"]
    subnets_cidrs=["192.168.0.0/24","192.168.1.0/24"]
  }
}
variable "region" {
  type = string
    default = "ap-south-1"
}

# vpc_info={
#    name="vpc1"
#     cidr_block="10.10.0.0/16"
#     subnets_names=["test1","test2"]
#     subnets_cidrs=["10.10.0.0/24","10.10.1.0/24"]
# }