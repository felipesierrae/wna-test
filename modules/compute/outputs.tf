output "asg_name" {
  value = aws_autoscaling_group.asg.name
}

output "compute_sg" {
  value = aws_security_group.compute_sg.id
}