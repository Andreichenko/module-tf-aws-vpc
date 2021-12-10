resource "aws_eip" "mod_nat" {
  count = var.multi_az_nat_gateway * var.az_count + var.single_nat_gateway * 1
  tags  = var.global_tags
  vpc   = true
}

output "aws_eip_nat_ips" {
  value = aws_eip.mod_nat.*.public_ip
}
