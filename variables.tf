variable "region" {}
variable "profile_name" {}
variable "cidr_block" {}
variable "vpc_name" {}
variable "public_subnet_1_cidr" {}
variable "public_subnet_2_cidr" {}
variable "private_subnet_1_cidr" {}
variable "private_subnet_2_cidr" {}
variable "public_subnet_1_az" {}
variable "public_subnet_2_az" {}
variable "private_subnet_1_az" {}
variable "private_subnet_2_az" {}
variable "public_subnet_1_name" {}
variable "public_subnet_2_name" {}
variable "private_subnet_1_name" {}
variable "private_subnet_2_name" {}
variable "igw_name" {}
variable "nat_gw_name" {}
variable "public_route_table_name" {}
variable "private_route_table_name" {}
variable "instance_type" {
  description = "The EC2 instance type."
  type        = string
  default     = "t3.micro"
}

variable "min_size" {
  description = "The minimum size for the Auto Scaling Group."
  type        = number
  default     = 2
}

variable "max_size" {
  description = "The maximum size for the Auto Scaling Group."
  type        = number
  default     = 4
}

variable "ami_id" {}
variable "instance_name_prefix" {}
