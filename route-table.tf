resource "aws_route_table" "public" {
  vpc_id = aws_vpc.default.id
  tags = merge(
    var.global_tags,
    {
      "Name" = "public"
    },
    var.public_route_table_tags,
  )
}
resource "aws_route" "public_internet_gateway" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.default.id
}

# Routing table for private subnets
resource "aws_route_table" "private" {
  count  = var.multi_az_nat_gateway * var.az_count + var.single_nat_gateway * 1
  vpc_id = aws_vpc.default.id
  tags = merge(
    var.global_tags,
    {
      "Name" = "private_az${count.index + 1}"
    },
    var.private_route_table_tags,
  )
}

resource "aws_route" "private_nat_gateway" {
  count                  = var.multi_az_nat_gateway * var.az_count + var.single_nat_gateway * 1
  route_table_id         = element(aws_route_table.private.*.id, count.index)
  nat_gateway_id         = element(aws_nat_gateway.nat_gateway.*.id, count.index)
  destination_cidr_block = "0.0.0.0/0"
  depends_on = [
    aws_route_table.private,
    aws_nat_gateway.nat_gateway,
  ]
}

