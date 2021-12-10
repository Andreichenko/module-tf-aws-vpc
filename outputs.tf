output "aws_vpc_id" {
  value = aws_vpc.default.id
}

output "aws_vpc_cidr" {
  value = aws_vpc.default.cidr_block
}

output "aws_subnet_admin_ids" {
  value = aws_subnet.admin.*.id
}

output "aws_subnet_private_working_ids" {
  value = aws_subnet.private_working.*.id
}

output "aws_subnet_private_prod_ids" {
  value = aws_subnet.private_prod.*.id
}

output "aws_subnet_public_ids" {
  value = aws_subnet.public.*.id
}

output "aws_route_table_private_ids" {
  value = aws_route_table.private.*.id
}

output "aws_nat_gateway_count" {
  value = length(aws_nat_gateway.nat_gateway.*.id)
}

output "aws_nat_gateway_ids" {
  value = aws_nat_gateway.nat_gateway.*.id
}