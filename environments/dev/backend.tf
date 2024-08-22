terraform {
  backend "s3" {
    bucket         = "devopstrainee-terraform-bucket"
    key            = "terraform/dev/terraform.tfstate"
    region         = "eu-west-2"
  }
}
