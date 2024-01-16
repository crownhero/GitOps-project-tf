# resource "aws_eks_fargate_profile" "fargate_profile" {
#   cluster_name           = var.clusterName
#   fargate_profile_name   = "redbiller-eks-fargate-profile"
#   pod_execution_role_arn = "arn:aws:iam::894303325874:role/AmazonEKSFargetProfilePods"
#   subnet_ids             = module.vpc.private_subnets
#   selector {
#     namespace = "prod" # specific namespace fargate profile will target
#   }

# }

# module "eks_fargate" {
#   source  = "terraform-module/eks-fargate-profile/aws"
#   version = "2.2.0"

#   cluster_name = var.clusterName
#   subnet_ids   = module.vpc.private_subnets
#   namespaces   = ["prod"]
#   labels = {
#     # "app.kubernetes.io/name"             = "default-service"
#     "eks.amazonaws.com/metrics/cadvisor" = "true"
#   }
#   tags = {
#     "ENV" = "prod-env"
#   }

# }



 