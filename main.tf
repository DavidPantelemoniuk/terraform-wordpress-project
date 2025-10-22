
# --- VPC Module ---
module "vpc" {
  source = "./modules/vpc"
  vpc_name = "wordpress-vpc"
  cidr_block = "10.0.0.0/16"
}

# --- Security Groups Module ---
module "security" {
  source   = "./modules/security"
  vpc_id   = module.vpc.vpc_id
  ingress_ports = [22, 80, 443]
}

# --- EC2 Module ---
module "ec2" {
  source            = "./modules/ec2"
  ami_id            = "ami-0341d95f75f311023"
  instance_type     = "t3.micro"
  subnet_id         = module.vpc.public_subnet_ids[0]
  sg_ids            = [module.security.wordpress_sg_id]
  key_name          = module.security.key_name
  user_data_file    = "wordpress.sh"
}

# --- RDS Module ---
module "rds" {
  source            = "./modules/rds"
  private_subnets   = module.vpc.private_subnet_ids
  sg_ids            = [module.security.rds_sg_id]
  username          = "admin"
  password          = "adminadmin"
}
