output "private_subnet_ids" {
  description = "Private subnet IDs in the VPC"
  value       = module.vpc.private_subnets
}

output "vpc_id" {
  description = "Id of the VPC"
  value       = module.vpc.vpc_id
}