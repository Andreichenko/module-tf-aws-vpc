# Required Variables
variable "vpc_cidr" {
  type        = string
  description = "The base CIDR that all subnets and vpcs will be created from. (Format 1.2.3.4/6)"
}

variable "public_subnets_list" {
  type        = list(string)
  description = "A list of the subnets to create for public subnets"
}

variable "private_subnets_list" {
  type        = list(string)
  description = "A list of the subnets to create for private subnets"
}

variable "admin_subnets_list" {
  type        = list(string)
  description = "A list of the subnets to create for admin subnets"
}

variable "vpc_name" {
  type        = string
  description = "The name tag of the VPC you are creating."
}

# Optional Variables (Added to resolve missing parameters in submodules)
variable "global_tags" {
  type        = map(string)
  default     = { "Managed By" = "Terraform" }
  description = "AWS tags that will be added to all resources"
}

variable "aws_azs" {
  type        = list(string)
  default     = ["us-east-1a", "us-east-1d", "us-east-1e", "us-east-1c"]
  description = "A list of availability zones in the region"
}

variable "vpc_instance_tenancy" {
  type        = string
  default     = "default"
  description = "The allowed tenancy of instances launched into the VPC"
}

variable "vpc_enable_dns_support" {
  type        = bool
  default     = true
  description = "A boolean flag to enable/disable DNS support in the VPC"
}

variable "vpc_enable_dns_hostnames" {
  type        = bool
  default     = true
  description = "A boolean flag to enable/disable DNS hostnames in the VPC"
}

# Outputs
output "aws_vpc_id" {
  value = aws_vpc.kube_vpc.id
}

output "aws_vpc_cidr" {
  value = aws_vpc.kube_vpc.cidr_block
}
