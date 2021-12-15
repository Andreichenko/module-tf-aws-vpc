# VPC
resource "aws_vpc" "kube_vpc" {
  cidr_block           = "${var.vpc_cidr}"
  instance_tenancy     = "${var.vpc_instance_tenancy}"
  enable_dns_support   = "${var.vpc_enable_dns_support}"
  enable_dns_hostnames = "${var.vpc_enable_dns_hostnames}"
  enable_classiclink   = "${var.vpc_enable_classiclink}"
  tags                 = "${merge(local.tags, map("Name", "${var.vpc_name}"))}"

  lifecycle = {
    ignore_changes = ["tags"]
  }
}

resource "aws_internet_gateway" "default" {
  vpc_id = "${aws_vpc.kube_vpc.id}"
  tags   = "${merge(local.tags, map("Name", "${var.vpc_name}"))}"
}

# NAT Gateways & EIP
resource "aws_nat_gateway" "nat_gateway" {
  count         = "${local._count_of_availability_zones}"
  subnet_id     = "${element(aws_subnet.public.*.id, count.index)}"
  allocation_id = "${element(aws_eip.mod_nat.*.id, count.index)}"
  tags          = "${merge(local.tags, map("Name", "Kubernetes NAT Gateway"))}"
  depends_on    = ["aws_internet_gateway.default", "aws_eip.mod_nat", "aws_subnet.public"]

  lifecycle = {
    ignore_changes = ["tags"]
  }
}

resource "aws_eip" "mod_nat" {
  count = "${length(local.avail_zones_list)}"
  tags  = "${local.tags}"
  vpc   = true
}


# Route Tables
## Public
resource "aws_route_table" "public" {
  vpc_id = "${aws_vpc.kube_vpc.id}"
  tags   = "${merge(local.tags, map("Name", "public"))}"
}

resource "aws_route" "public_internet_gateway" {
  route_table_id         = "${aws_route_table.public.id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.default.id}"
}