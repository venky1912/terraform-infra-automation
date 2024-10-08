module "vpc" {
    source = "git::https://github.com/venky1912/terraform-modules.git//aws/modules/vpc?ref=main"
    
  # Variables required by the network module
  vpc_cidr = var.vpc_cidr
  public_subnets = var.public_subnets
  private_subnets = var.private_subnets
  region         = var.region
}