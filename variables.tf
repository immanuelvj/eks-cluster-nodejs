variable "environment" {
  type        = string
  description = "Name of the environment"
}

variable "vpc_cidr_block" {
  type        = string
  description = "CIDR Block IP range value for VPC"
}

variable "vpc_availability_zones" {
  type        = list(string)
  description = "List of Availability zones to create subnets in VPC"
}

variable "vpc_private_subnets" {
  type        = list(string)
  description = "List of Private subnet IP range for VPC subnet creation"
}

variable "vpc_public_subnets" {
  type        = list(string)
  description = "List of Public subnet IP range for VPC subnet creation"
}

variable "cluster_name" {
  type        = string
  description = "Name of the EKS Cluster"
}

variable "eks_oidc_thumbprint" {
  type        = string
  description = "Thumbprint value for EKS OIDC"
}