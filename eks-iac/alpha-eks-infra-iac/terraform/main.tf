provider "kubernetes" {
  host                   = module.eks.cluster_endpoint
  cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)
}

provider "aws" {
  region = var.region
}

data "aws_availability_zones" "available" {}


locals {
  cluster_name = var.clusterName
}

data "aws_subnet" "private_subnets" {
  for_each = toset(["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"])

  cidr_block = each.value
}

data "aws_subnet" "public_subnets" {
  for_each = toset(["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"])

  cidr_block = each.value
}


