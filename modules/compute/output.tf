locals {
  aws_iam_oidc_connect_provider_extract_from_arn = element(split("oidc-provider/", "${aws_iam_openid_connect_provider.oidc_provider.arn}"), 1)
}

output "aws_iam_openid_connect_provider_extract_from_arn" {
  description = "AWS IAM Open ID Connect Provider extract from ARN"
  value       = local.aws_iam_oidc_connect_provider_extract_from_arn
}

output "cluster_id" {
  description = "Cluster ID"
  value       = aws_eks_cluster.eks_cluster.endpoint
}

output "certificate_authority" {
  description = "EKS Cluster Certificate Authority Data"
  value       = aws_eks_cluster.eks_cluster.certificate_authority[0].data
}

output "cluster_endpoint" {
  description = "EKS Cluster Endpoint"
  value       = aws_eks_cluster.eks_cluster.endpoint
}

output "eks_oidc_arn" {
  description = "ARN of the OpenID connect"
  value = aws_iam_openid_connect_provider.oidc_provider.arn
}

output "cluster_name" {
    description = "Name of the cluster"
    value = aws_eks_cluster.eks_cluster.name
}