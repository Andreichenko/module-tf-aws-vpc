# Subnet creation
## Admin
resource "aws_subnet" "admin" {
  count             = "${local._count_of_availability_zones}"
  vpc_id            = "${aws_vpc.kube_vpc.id}"
  cidr_block        = "${local.admin_cidr_subnets[count.index]}"
  availability_zone = "${local.avail_zones_list[count.index]}"
  tags              = "${merge(local.tags, map("Name", "Admin Subnet"))}"
}

#route table association for admins
resource "aws_route_table_association" "admin" {
  count          = "${local._count_of_availability_zones}"
  subnet_id      = "${element(aws_subnet.admin.*.id, count.index)}"
  route_table_id = "${element(aws_route_table.private.*.id, count.index)}"
}

## Public
resource "aws_subnet" "public" {
  count             = "${local._count_of_availability_zones}"
  vpc_id            = "${aws_vpc.kube_vpc.id}"
  cidr_block        = "${local.public_cidr_subnets[count.index]}"
  availability_zone = "${local.avail_zones_list[count.index]}"
  tags              = "${merge(local.tags, map("Name", "Public Subnet"))}"
}

