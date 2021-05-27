provider "aws" {
  region = var.region-master
}

module "Lambda" {
  source = "./Lambda"
}