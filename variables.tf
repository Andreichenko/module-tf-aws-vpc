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

variable "vpc_enable_dns_hostnames" {
  default = "true"
}

variable "vpc_enable_classiclink" {
  default = "false"
}
variable "admin_subnet_parent_cidr" {
  description = "parent CIDR for the administrative subnets"
  default     = ".0.0/19"
}

variable "admin_subnet_cidrs" {
  description = "CIDRs for the adminsitrative subnets"
  default = {
    zone0 = ".0.0/21"
    zone1 = ".8.0/21"
    zone2 = ".16.0/21"
    zone3 = ".24.0/21"
  }
}

variable "admin_subnet_tags" {
  description = "Tags to apply to the admin subnet"
  default     = {}
}