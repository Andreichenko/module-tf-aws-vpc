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
