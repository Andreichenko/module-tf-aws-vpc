# Required Variables
variable "vpc_cidr" {
  description = "The base CIDR that all subnets and vpcs will be created from. (Format 1.2.3.4/6)"
}

variable "public_subnets_list" {
  type        = "list"
  description = "A list of the subnets to create for public subnets"
}

variable "private_subnets_list" {
  type        = "list"
  description = "A list of the subnets to create for private subnets"
}

variable "admin_subnets_list" {
  type        = "list"
  description = "A list of the subnets to create for admin subnets"
}

variable "vpc_name" {
  description = "The name tag of the VPC you are creating."
}

output "aws_vpc_id" {
  value = "${aws_vpc.kube_vpc.id}"
}

output "aws_vpc_cidr" {
  value = "${aws_vpc.kube_vpc.cidr_block}"
}
