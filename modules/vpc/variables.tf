variable "cidr_block" {
  description = "CIDR block for the VPC."
  type        = string
}

variable "vpc_name" {
  description = "The name of the VPC."
  type        = string
}

variable "public_subnet_1_cidr" {
  description = "CIDR block for the first public subnet."
  type        = string
}

variable "public_subnet_2_cidr" {
  description = "CIDR block for the second public subnet."
  type        = string
}

variable "private_subnet_1_cidr" {
  description = "CIDR block for the first private subnet."
  type        = string
}

variable "private_subnet_2_cidr" {
  description = "CIDR block for the second private subnet."
  type        = string
}

variable "public_subnet_1_az" {
  description = "Availability Zone for the first public subnet."
  type        = string
}

variable "public_subnet_2_az" {
  description = "Availability Zone for the second public subnet."
  type        = string
}

variable "private_subnet_1_az" {
  description = "Availability Zone for the first private subnet."
  type        = string
}

variable "private_subnet_2_az" {
  description = "Availability Zone for the second private subnet."
  type        = string
}

variable "public_subnet_1_name" {
  description = "The name for the first public subnet."
  type        = string
}

variable "public_subnet_2_name" {
  description = "The name for the second public subnet."
  type        = string
}

variable "private_subnet_1_name" {
  description = "The name for the first private subnet."
  type        = string
}

variable "private_subnet_2_name" {
  description = "The name for the second private subnet."
  type        = string
}

variable "igw_name" {
  description = "The name of the Internet Gateway."
  type        = string
}

variable "nat_gw_name" {
  description = "The name of the NAT Gateway."
  type        = string
}

variable "public_route_table_name" {
  description = "The name for the public route table."
  type        = string
}

variable "private_route_table_name" {
  description = "The name for the private route table."
  type        = string
}
