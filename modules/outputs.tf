output "provisioned_cidrs" {
  value = {
    public_cidr_subnets  = "${local.public_cidr_subnets}"
    private_cidr_subnets = "${local.private_cidr_subnets}"
    admin_cidr_subnets   = "${local.admin_cidr_subnets}"
  }
}

output "aws_subnet_admin_ids" {
  value = ["${aws_subnet.admin.*.id}"]
}


output "aws_route_table_public_ids" {
  value = ["${aws_route_table.public.id}"]
}

output "aws_route_table_private_ids" {
  value = ["${aws_route_table.private.*.id}"]
}

output "aws_subnet_public_ids" {
  value   = ["${aws_subnet.public.*.id}"]
}

output "aws_subnet_private_ids" {
  value = ["${aws_subnet.private.*.id}"]
}