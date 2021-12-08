output "aws_vpc_id" {
  value = aws_vpc.default.id
}

output "aws_vpc_cidr" {
  value = aws_vpc.default.cidr_block
}

output "aws_subnet_admin_ids" {
  value = aws_subnet.admin.*.id
}