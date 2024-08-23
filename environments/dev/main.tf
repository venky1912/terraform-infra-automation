module "vpc" {
    source = "git::https://github.com/venky1912/terraform-modules.git//aws/modules/vpc?ref=main"
    
  # Variables required by the network module
  cidr_block = var.vpc_cidr
  public_subnets = var.public_subnets
  private_subnets = var.private_subnets
  region         = var.region
}