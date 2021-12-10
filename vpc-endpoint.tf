resource "aws_vpc_endpoint" "s3_endpoint" {
  count        = var.enable_s3_vpc_endpoint ? 1 : 0
  vpc_id       = aws_vpc.default.id
  service_name = "com.amazonaws.${var.aws_region}.s3"
  route_table_ids = concat(
    aws_route_table.private.*.id,
    var.s3_vpc_endpoint_route_table_ids,
  )
  policy = var.s3_vpc_endpoint_policy
}