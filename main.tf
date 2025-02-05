locals {
  account_id = data.aws_caller_identity.current.account_id
  region     = data.aws_region.current.name
}

data "aws_caller_identity" "current" {}

data "aws_region" "current" {}

module "networking" {
  source                 = "./modules/networking"
  environment            = var.environment
  vpc_cidr_block         = var.vpc_cidr_block
  vpc_availability_zones = var.vpc_availability_zones
  vpc_private_subnets    = var.vpc_private_subnets
  vpc_public_subnets     = var.vpc_public_subnets
  vpc_secondary_cidr_block = var.vpc_secondary_cidr_block
}

module "compute" {
  source              = "./modules/compute"
  cluster_name        = var.cluster_name
  private_subnet_ids  = module.networking.private_subnet_ids
  eks_oidc_thumbprint = var.eks_oidc_thumbprint
}

module "ingress-controller" {
  source                                           = "./modules/ingress-controller"
  aws_region                                       = local.region
  cluster_id                                       = module.compute.cluster_id
  cluster_ca_data                                  = module.compute.certificate_authority
  cluster_endpoint                                 = module.compute.cluster_endpoint
  vpc_id                                           = module.networking.vpc_id
  eks_oidc_arn                                     = module.compute.eks_oidc_arn
  aws_iam_openid_connect_provider_extract_from_arn = module.compute.aws_iam_openid_connect_provider_extract_from_arn
  cluster_name = module.compute.cluster_name
}