variable "vpc_id" {
  description = "ID of the VPC to launch resources."
  type        = string
}

variable "private_subnet_ids" {
  description = "List of public subnet IDs for the Auto Scaling Group."
  type        = list(string)
}

variable "instance_type" {
  description = "The EC2 instance type."
  type        = string
}

variable "min_size" {
  description = "The minimum size for the Auto Scaling Group."
  type        = number
}

variable "max_size" {
  description = "The maximum size for the Auto Scaling Group."
  type        = number
}

variable "ami_id" {
  description = "AMI ID to launch the EC2 instances."
  type        = string
}

variable "instance_name_prefix" {
  description = "Prefix for the EC2 instances names."
  type        = string
}
