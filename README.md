# terraform-aws-vpc
terraform-aws-vpc module
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12 |
| aws | >=2.30.0 |

## Providers

| Name | Version |
|------|---------|
| aws | >=2.30.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| admin\_subnet\_cidrs | CIDRs for the adminsitrative subnets | `map` | <pre>{<br>  "zone0": ".0.0/21",<br>  "zone1": ".8.0/21",<br>  "zone2": ".16.0/21",<br>  "zone3": ".24.0/21"<br>}</pre> | no |
| admin\_subnet\_parent\_cidr | parent CIDR for the administrative subnets | `string` | `".0.0/19"` | no |
| admin\_subnet\_tags | Tags to apply to the admin subnet | `map` | `{}` | no |
| aws\_azs | comma separated string of availability zones in order of precedence | `string` | `"us-east-1a, us-east-1d, us-east-1e, us-east-1c"` | no |
| aws\_region | n/a | `any` | n/a | yes |
| aws\_vpc\_name | n/a | `string` | `"vpc"` | no |
| az\_count | number of active availability zones in VPC | `string` | `"3"` | no |
| enable\_s3\_vpc\_endpoint | Create a VPC S3 gateway endpoint and private subnet route entries. This will route S3 traffic over private network rather than over NAT gateways. | `string` | `"false"` | no |
| global\_tags | AWS tags that will be added to all resources | `map(string)` | <pre>{<br>  "Managed By": "Terraform"<br>}</pre> | no |
| internet\_gateway\_tags | Tags to apply to the internet gateway | `map` | `{}` | no |
| multi\_az\_nat\_gateway | place a NAT gateway in each AZ | `number` | `1` | no |
| private\_prod\_subnet\_cidrs | CIDRs for the private production subnets | `map` | <pre>{<br>  "zone0": ".64.0/21",<br>  "zone1": ".72.0/21",<br>  "zone2": ".80.0/21",<br>  "zone3": ".88.0/21"<br>}</pre> | no |
| private\_prod\_subnet\_parent\_cidr | parent CIDR for the private production subnets | `string` | `".64.0/19"` | no |
| private\_prod\_subnet\_tags | Tags to apply to the private production subnets | `map` | `{}` | no |
| private\_route\_table\_tags | Tags to apply to the private route table | `map` | `{}` | no |
| private\_working\_subnet\_cidrs | CIDRs for the private working subnets | `map` | <pre>{<br>  "zone0": ".96.0/21",<br>  "zone1": ".104.0/21",<br>  "zone2": ".112.0/21",<br>  "zone3": ".120.0/21"<br>}</pre> | no |
| private\_working\_subnet\_parent\_cidr | parent CIDR for the private working subnets | `string` | `".96.0/19"` | no |
| private\_working\_subnet\_tags | Tags to apply to the private working subnets | `map` | `{}` | no |
| public\_route\_table\_tags | Tags to apply to the public route table | `map` | `{}` | no |
| public\_subnet\_cidrs | CIDRs for the public subnets | `map` | <pre>{<br>  "zone0": ".32.0/21",<br>  "zone1": ".40.0/21",<br>  "zone2": ".48.0/21",<br>  "zone3": ".56.0/21"<br>}</pre> | no |
| public\_subnet\_parent\_cidr | parent CIDR for the public subnets | `string` | `".32.0/19"` | no |
| public\_subnet\_tags | Tags to apply to the public subnets | `map` | `{}` | no |
| s3\_vpc\_endpoint\_policy | S3 VPC endpoint gateway policy document. Bucket and IAM policies still apply. | `string` | `"{\n    \"Statement\": [\n        {   \n            \"Sid\": \"FullAccess\",\n            \"Action\": \"*\",\n            \"Effect\": \"Allow\",\n            \"Resource\": \"*\",\n            \"Principal\": \"*\"\n        }\n    ],\n    \"Version\": \"2008-10-17\"\n}\n"` | no |
| s3\_vpc\_endpoint\_route\_table\_ids | By default routes to the s3 endpoint are added for private subnet route tables. Pass additional route table ids that require routes. | `list(string)` | `[]` | no |
| single\_nat\_gateway | use a single NAT gateway to serve outbound traffic for all AZs | `number` | `0` | no |
| vpc\_cidr\_base | n/a | `string` | `"10.20"` | no |
| vpc\_enable\_classiclink | n/a | `string` | `"false"` | no |
| vpc\_enable\_dns\_hostnames | n/a | `string` | `"true"` | no |
| vpc\_enable\_dns\_support | n/a | `string` | `"true"` | no |
| vpc\_instance\_tenancy | n/a | `string` | `"default"` | no |

## Outputs

| Name | Description |
|------|-------------|
| aws\_eip\_nat\_ips | n/a |
| aws\_nat\_gateway\_count | n/a |
| aws\_nat\_gateway\_ids | n/a |
| aws\_route\_table\_private\_ids | n/a |
| aws\_subnet\_admin\_ids | n/a |
| aws\_subnet\_private\_prod\_ids | n/a |
| aws\_subnet\_private\_working\_ids | n/a |
| aws\_subnet\_public\_ids | n/a |
| aws\_vpc\_cidr | n/a |
| aws\_vpc\_id | n/a |

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12 |
| aws | >=2.30.0 |

## Providers

| Name | Version |
|------|---------|
| aws | >=2.30.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| admin\_subnet\_cidrs | CIDRs for the adminsitrative subnets | `map` | <pre>{<br>  "zone0": ".0.0/21",<br>  "zone1": ".8.0/21",<br>  "zone2": ".16.0/21",<br>  "zone3": ".24.0/21"<br>}</pre> | no |
| admin\_subnet\_parent\_cidr | parent CIDR for the administrative subnets | `string` | `".0.0/19"` | no |
| admin\_subnet\_tags | Tags to apply to the admin subnet | `map` | `{}` | no |
| aws\_azs | comma separated string of availability zones in order of precedence | `string` | `"us-east-1a, us-east-1d, us-east-1e, us-east-1c"` | no |
| aws\_region | n/a | `any` | n/a | yes |
| aws\_vpc\_name | n/a | `string` | `"vpc"` | no |
| az\_count | number of active availability zones in VPC | `string` | `"3"` | no |
| enable\_s3\_vpc\_endpoint | Create a VPC S3 gateway endpoint and private subnet route entries. This will route S3 traffic over private network rather than over NAT gateways. | `string` | `"false"` | no |
| global\_tags | AWS tags that will be added to all resources | `map(string)` | <pre>{<br>  "Managed By": "Terraform"<br>}</pre> | no |
| internet\_gateway\_tags | Tags to apply to the internet gateway | `map` | `{}` | no |
| multi\_az\_nat\_gateway | place a NAT gateway in each AZ | `number` | `1` | no |
| private\_prod\_subnet\_cidrs | CIDRs for the private production subnets | `map` | <pre>{<br>  "zone0": ".64.0/21",<br>  "zone1": ".72.0/21",<br>  "zone2": ".80.0/21",<br>  "zone3": ".88.0/21"<br>}</pre> | no |
| private\_prod\_subnet\_parent\_cidr | parent CIDR for the private production subnets | `string` | `".64.0/19"` | no |
| private\_prod\_subnet\_tags | Tags to apply to the private production subnets | `map` | `{}` | no |
| private\_route\_table\_tags | Tags to apply to the private route table | `map` | `{}` | no |
| private\_working\_subnet\_cidrs | CIDRs for the private working subnets | `map` | <pre>{<br>  "zone0": ".96.0/21",<br>  "zone1": ".104.0/21",<br>  "zone2": ".112.0/21",<br>  "zone3": ".120.0/21"<br>}</pre> | no |
| private\_working\_subnet\_parent\_cidr | parent CIDR for the private working subnets | `string` | `".96.0/19"` | no |
| private\_working\_subnet\_tags | Tags to apply to the private working subnets | `map` | `{}` | no |
| public\_route\_table\_tags | Tags to apply to the public route table | `map` | `{}` | no |
| public\_subnet\_cidrs | CIDRs for the public subnets | `map` | <pre>{<br>  "zone0": ".32.0/21",<br>  "zone1": ".40.0/21",<br>  "zone2": ".48.0/21",<br>  "zone3": ".56.0/21"<br>}</pre> | no |
| public\_subnet\_parent\_cidr | parent CIDR for the public subnets | `string` | `".32.0/19"` | no |
| public\_subnet\_tags | Tags to apply to the public subnets | `map` | `{}` | no |
| s3\_vpc\_endpoint\_policy | S3 VPC endpoint gateway policy document. Bucket and IAM policies still apply. | `string` | `"{\n    \"Statement\": [\n        {   \n            \"Sid\": \"FullAccess\",\n            \"Action\": \"*\",\n            \"Effect\": \"Allow\",\n            \"Resource\": \"*\",\n            \"Principal\": \"*\"\n        }\n    ],\n    \"Version\": \"2008-10-17\"\n}\n"` | no |
| s3\_vpc\_endpoint\_route\_table\_ids | By default routes to the s3 endpoint are added for private subnet route tables. Pass additional route table ids that require routes. | `list(string)` | `[]` | no |
| single\_nat\_gateway | use a single NAT gateway to serve outbound traffic for all AZs | `number` | `0` | no |
| vpc\_cidr\_base | n/a | `string` | `"10.20"` | no |
| vpc\_enable\_classiclink | n/a | `string` | `"false"` | no |
| vpc\_enable\_dns\_hostnames | n/a | `string` | `"true"` | no |
| vpc\_enable\_dns\_support | n/a | `string` | `"true"` | no |
| vpc\_instance\_tenancy | n/a | `string` | `"default"` | no |

## Outputs

| Name | Description |
|------|-------------|
| aws\_eip\_nat\_ips | n/a |
| aws\_nat\_gateway\_count | n/a |
| aws\_nat\_gateway\_ids | n/a |
| aws\_route\_table\_private\_ids | n/a |
| aws\_subnet\_admin\_ids | n/a |
| aws\_subnet\_private\_prod\_ids | n/a |
| aws\_subnet\_private\_working\_ids | n/a |
| aws\_subnet\_public\_ids | n/a |
| aws\_vpc\_cidr | n/a |
| aws\_vpc\_id | n/a |

