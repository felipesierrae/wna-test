variable "name" {
  description = "Name of the ALB"
  type        = string
}

variable "security_group_ids" {
  description = "List of security group IDs associated with the ALB"
  type        = list(string)
}

variable "subnet_ids" {
  description = "List of subnets where the ALB is deployed"
  type        = list(string)
}

variable "enable_deletion_protection" {
  description = "Enables or disables the deletion protection of the ALB"
  type        = bool
  default     = false
}

variable "target_group_name" {
  description = "Name of the target group"
  type        = string
}

variable "target_group_port" {
  description = "Port of the target group"
  type        = number
}

variable "target_group_protocol" {
  description = "Protocol of the target group"
  type        = string
}

variable "vpc_id" {
  description = "ID of the VPC where the target group is deployed"
  type        = string
}

variable "health_check_interval" {
  description = "Interval (in seconds) for the health checks"
  type        = number
  default     = 30
}

variable "health_check_path" {
  description = "Path for the health checks"
  type        = string
  default     = "/"
}

variable "health_check_protocol" {
  description = "Protocol for the health checks"
  type        = string
  default     = "HTTP"
}

variable "health_check_timeout" {
  description = "Timeout for the health checks"
  type        = number
  default     = 5
}

variable "healthy_threshold" {
  description = "Threshold for healthy instances"
  type        = number
  default     = 3
}

variable "unhealthy_threshold" {
  description = "Threshold for unhealthy instances"
  type        = number
  default     = 3
}

variable "listener_port" {
  description = "Port of the ALB listener"
  type        = number
}

variable "listener_protocol" {
  description = "Protocol of the ALB listener"
  type        = string
}

variable "autoscaling_group_name" {
  description = "Name of the Auto Scaling group"
  type        = string
}

variable "tags" {
  description = "Tags for the resources"
  type        = map(string)
  default     = {}
}
