# Subnet creation
## Admin
resource "aws_subnet" "admin" {
  count             = "${local._count_of_availability_zones}"
  vpc_id            = "${aws_vpc.kube_vpc.id}"
  cidr_block        = "${local.admin_cidr_subnets[count.index]}"
  availability_zone = "${local.avail_zones_list[count.index]}"
  tags              = "${merge(local.tags, map("Name", "Admin Subnet"))}"
}