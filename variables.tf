variable "aws_region" {
}

variable "aws_vpc_name" {
  default = "vpc"
}

variable "aws_azs" {
  description = "comma separated string of availability zones in order of precedence"
  default     = "us-east-1a, us-east-1d, us-east-1e, us-east-1c"
}

variable "az_count" {
  description = "number of active availability zones in VPC"
  default     = "3"
}

variable "vpc_cidr_base" {
  default = "10.20"
}

variable "vpc_instance_tenancy" {
  default = "default"
}

variable "vpc_enable_dns_support" {
  default = "true"
}
