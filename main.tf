provider "aws" {
  region = var.region
  profile = var.profile_name
}

module "vpc" {
  source = "./modules/vpc"

  cidr_block                 = var.cidr_block
  vpc_name                   = var.vpc_name
  public_subnet_1_cidr       = var.public_subnet_1_cidr
  public_subnet_2_cidr       = var.public_subnet_2_cidr
  private_subnet_1_cidr      = var.private_subnet_1_cidr
  private_subnet_2_cidr      = var.private_subnet_2_cidr
  public_subnet_1_az         = var.public_subnet_1_az
  public_subnet_2_az         = var.public_subnet_2_az
  private_subnet_1_az        = var.private_subnet_1_az
  private_subnet_2_az        = var.private_subnet_2_az
  public_subnet_1_name       = var.public_subnet_1_name
  public_subnet_2_name       = var.public_subnet_2_name
  private_subnet_1_name      = var.private_subnet_1_name
  private_subnet_2_name      = var.private_subnet_2_name
  igw_name                   = var.igw_name
  nat_gw_name                = var.nat_gw_name
  public_route_table_name    = var.public_route_table_name
  private_route_table_name   = var.private_route_table_name
}

module "compute" {
  source = "./modules/compute"

  vpc_id                     = module.vpc.vpc_id
  private_subnet_ids          = [module.vpc.public_subnet_1_id, module.vpc.public_subnet_2_id]
  # private_subnet_ids          = [module.vpc.public_subnet_1_id, module.vpc.public_subnet_2_id]
  instance_type              = var.instance_type
  min_size                   = var.min_size
  max_size                   = var.max_size
  ami_id                     = var.ami_id
  instance_name_prefix       = var.instance_name_prefix
}

module "alb" {
  source                  = "./modules/alb"
  name                    = "wna-alb"
  security_group_ids      = [module.compute.compute_sg]
  subnet_ids              = [module.vpc.public_subnet_1_id, module.vpc.public_subnet_2_id]
  enable_deletion_protection = false
  target_group_name       = "wna-tg"
  target_group_port       = 80
  target_group_protocol   = "HTTP"
  vpc_id                  = module.vpc.vpc_id
  health_check_interval   = 30
  health_check_path       = "/"
  health_check_protocol   = "HTTP"
  health_check_timeout    = 5
  healthy_threshold       = 3
  unhealthy_threshold     = 3
  listener_port           = 80
  listener_protocol       = "HTTP"
  autoscaling_group_name  = module.compute.asg_name

  tags = {
    Environment = "dev"
    Project     = "wna-test"
  }
}

# backend.tf

terraform {
  backend "s3" {
    bucket         = "fs-wna.test"
    region         = "us-east-1"
    encrypt        = true
    key    = "terraform/state.tfstate"
    dynamodb_table = "terraform-lock-table"
    profile = "wna-test"

  }
}