variable "region" {
  description = "AWS region"
  type        = string
  default     = "eu-west-2"
}

variable "clusterName" {
  description = "Name of the EKS cluster"
  type        = string
  default     = "redbiller-eks-cluster-prod"
}

variable "s3_bucket" {
  description = "S3 bucket name"
  type        = string
  default     = "redbiller-eks-ecosystem-backend-state-prod"
}
