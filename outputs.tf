output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet_1_id" {
  value = module.vpc.public_subnet_1_id
}

output "public_subnet_2_id" {
  value = module.vpc.public_subnet_2_id
}

output "private_subnet_1_id" {
  value = module.vpc.private_subnet_1_id
}

output "private_subnet_2_id" {
  value = module.vpc.private_subnet_2_id
}

output "igw_id" {
  value = module.vpc.igw_id
}

output "nat_gw_id" {
  value = module.vpc.nat_gw_id
}

output "asg_name" {
  value = module.compute.asg_name
}

output "compute_sg" {
  value = module.compute.compute_sg
}