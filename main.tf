provider "aws" {
  region = "us-west-2"
}

module "networking" {
  source = "./modules/networking"
}
