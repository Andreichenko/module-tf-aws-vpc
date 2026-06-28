# Dynamics house all the CIDR and other dynamic elements of this module

locals {
  public_cidr_subnets  = var.public_subnets_list
  private_cidr_subnets = var.private_subnets_list
  admin_cidr_subnets   = var.admin_subnets_list

  # Added missing locals to resolve undeclared local variables errors
  tags                         = var.global_tags
  avail_zones_list             = var.aws_azs
  _count_of_availability_zones = length(var.aws_azs)
}
