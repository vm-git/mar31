variable "vpc_info" {
  type=object({
    cidr_block=string
  })
  default = {
    cidr_block = "192.168.0.0/16"
  }
}
variable "region" {
  type = string
    default = "ap-south-1"
}