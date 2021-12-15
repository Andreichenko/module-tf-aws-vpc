# Dynamics house all the CIDR and other dynamic elements of this module

locals {
  public_cidr_subnets  = ["${var.public_subnets_list}"]
  private_cidr_subnets = ["${var.private_subnets_list}"]
  admin_cidr_subnets   = ["${var.admin_subnets_list}"]
}

## Public
resource "aws_subnet" "public" {
  count             = "${local._count_of_availability_zones}"
  vpc_id            = "${aws_vpc.kube_vpc.id}"
  cidr_block        = "${local.public_cidr_subnets[count.index]}"
  availability_zone = "${local.avail_zones_list[count.index]}"
  tags              = "${merge(local.tags, map("Name", "Public Subnet"))}"
}
