resource "aws_subnet" "admin" {
  count             = var.az_count
  vpc_id            = aws_vpc.default.id
  cidr_block        = "${var.vpc_cidr_base}${var.admin_subnet_cidrs[format("zone%d", count.index)]}"
  availability_zone = element(split(", ", var.aws_azs), count.index)
  tags = merge(
    var.global_tags,
    {
      "Name" = "admin_az${count.index + 1}"
    },
    var.admin_subnet_tags,
  )
}

resource "aws_route_table_association" "private_admin" {
  count          = var.az_count
  subnet_id      = element(aws_subnet.admin.*.id, count.index)
  route_table_id = element(aws_route_table.private.*.id, count.index)
}

resource "aws_subnet" "public" {
  count             = var.az_count
  vpc_id            = aws_vpc.default.id
  cidr_block        = "${var.vpc_cidr_base}${var.public_subnet_cidrs[format("zone%d", count.index)]}"
  availability_zone = element(split(", ", var.aws_azs), count.index)
  tags = merge(
    var.global_tags,
    {
      "Name" = "public_az${count.index + 1}"
    },
    var.public_subnet_tags,
  )
}

resource "aws_route_table_association" "public_public" {
  count          = var.az_count
  subnet_id      = element(aws_subnet.public.*.id, count.index)
  route_table_id = aws_route_table.public.id
}

resource "aws_subnet" "private_prod" {
  count             = var.az_count
  vpc_id            = aws_vpc.default.id
  cidr_block        = "${var.vpc_cidr_base}${var.private_prod_subnet_cidrs[format("zone%d", count.index)]}"
  availability_zone = element(split(", ", var.aws_azs), count.index)
  tags = merge(
    var.global_tags,
    {
      "Name" = "private_prod_az${count.index + 1}"
    },
    var.private_prod_subnet_tags,
  )
}


resource "aws_route_table_association" "private_private_prod" {
  count          = var.az_count
  subnet_id      = element(aws_subnet.private_prod.*.id, count.index)
  route_table_id = element(aws_route_table.private.*.id, count.index)
}

resource "aws_subnet" "private_working" {
  count             = var.az_count
  vpc_id            = aws_vpc.default.id
  cidr_block        = "${var.vpc_cidr_base}${var.private_working_subnet_cidrs[format("zone%d", count.index)]}"
  availability_zone = element(split(", ", var.aws_azs), count.index)
  tags = merge(
    var.global_tags,
    {
      "Name" = "private_working_az${count.index + 1}"
    },
    var.private_working_subnet_tags,
  )
}

resource "aws_route_table_association" "private_private_working" {
  count          = var.az_count
  subnet_id      = element(aws_subnet.private_working.*.id, count.index)
  route_table_id = element(aws_route_table.private.*.id, count.index)
}

