output "aws_vpc_id" {
  value = aws_vpc.default.id
}

output "aws_vpc_cidr" {
  value = aws_vpc.default.cidr_block
}
