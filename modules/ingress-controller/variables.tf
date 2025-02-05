variable "aws_iam_openid_connect_provider_extract_from_arn" {
  type        = string
  description = "IAM OpenID Connect provider endpoint"
}

variable "cluster_id" {
  type        = string
  description = "Cluster ID of the EKS Cluster"
}

variable "cluster_ca_data" {
  type        = string
  description = "Cluster CA Authority Data"
}

variable "cluster_endpoint" {
  type        = string
  description = "Cluster Endpoint"
}

variable "vpc_id" {
  type        = string
  description = "ID of the VPC"
}

variable "aws_region" {
  type        = string
  description = "AWS Region"
}

variable "eks_oidc_arn" {
  type = string
  description = "EKS OpenID connect ARN"
}