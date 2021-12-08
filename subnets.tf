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