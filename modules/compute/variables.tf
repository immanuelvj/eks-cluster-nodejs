variable "cluster_name" {
  type        = string
  description = "Name of the EKS Cluster"
}

variable "private_subnet_ids" {
  type        = list(string)
  description = "Private Subnet IDs of the VPC"
}

variable "eks_oidc_thumbprint" {
  type        = string
  description = "Thumbprint value for EKS OIDC"
}