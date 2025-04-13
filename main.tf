terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.79.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.34.0"
    }
  }
}

provider "aws" {
  region = var.region
}

provider "kubernetes" {
  config_path    = var.kubeconfig_path
  config_context = var.cluster_name

}


module "vpc" {
  source                        = "./modules/vpc"
  vpc_cidr_block                = var.vpc_cidr_block
  vpc_public_subnet_cidr_block  = var.vpc_public_subnet_cidr_block
  vpc_private_subnet_cidr_block = var.vpc_private_subnet_cidr_block
  vpc_database_subnet           = var.vpc_database_subnet
  vpc_id                        = module.vpc.vpc_id
  vpc_availability_zones        = var.vpc_availability_zones
  environment                   = var.environment
  vpc_name                      = var.vpc_name
}

module "bastion_host" {
  source         = "./modules/bastion"
  instance_type  = var.instance_type
  key_name       = var.key_name
  vpc_id         = module.vpc.vpc_id
  public_subnets = module.vpc.public_subnets
  bastion_name   = var.bastion_name
}

module "eks" {
  source                               = "./modules/eks"
  public_subnet_ids                    = module.vpc.public_subnets
  private_subnet_ids                   = module.vpc.private_subnets
  cluster_endpoint_private_access      = var.cluster_endpoint_private_access
  cluster_endpoint_public_access       = var.cluster_endpoint_public_access
  service_ipv4_cidr                    = var.service_ipv4_cidr
  cluster_endpoint_public_access_cidrs = var.cluster_endpoint_public_access_cidrs
  eks_oidc_root_ca_thumbprint          = var.eks_oidc_root_ca_thumbprint
  users                                = var.users
  node_role_arn                        = var.node_role_arn
  master_role_arn                      = var.master_role_arn
  cluster_name                         = var.cluster_name
  cluster_version                      = var.cluster_version
  node_group_name                      = var.node_group_name
  key_name                             = var.key_name
  environment                          = var.environment
  cluster_alias                       = var.cluster_alias 
  region                               = var.region


}