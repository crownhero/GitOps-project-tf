module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "19.0.4"

  cluster_name    = local.cluster_name
  cluster_version = "1.27"

  vpc_id                         = module.vpc.vpc_id
  subnet_ids                     = module.vpc.private_subnets
  cluster_endpoint_public_access = true

  eks_managed_node_group_defaults = {
    ami_type = "AL2_x86_64"

  }

  eks_managed_node_groups = {
    one = {
      name = "node-group-1"

      instance_types = ["c5.xlarge"]

      min_size     = 1
      max_size     = 3
      desired_size = 1

      scaling_config = {
        min_capacity = 1
        max_capacity = 3
      }
    }

    two = {
      name = "node-group-2"

      instance_types = ["c5.xlarge"]

      min_size     = 1
      max_size     = 2
      desired_size = 1

      scaling_config = {
        min_capacity = 1
        max_capacity = 3
      }
    }
  }


}

# module "eks_fargate" {
#   source  = "terraform-module/eks-fargate-profile/aws"
#   version = "2.2.0"

#   cluster_name = local.cluster_name
#   subnet_ids   = module.vpc.private_subnets
#   namespaces   = ["prod"]
#   tags = {
#     "ENV" = "prod"
#   }

# }









