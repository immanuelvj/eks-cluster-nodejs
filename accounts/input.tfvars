environment            = "development"
vpc_cidr_block         = "192.168.128.64/26"
vpc_availability_zones = ["us-east-1a", "us-east-1b"]
vpc_private_subnets    = ["192.168.128.64/28", "192.168.128.80/28"]
vpc_public_subnets     = ["192.168.128.96/28", "192.168.128.112/28"]
cluster_name           = "nodejs-app"
eks_oidc_thumbprint    = "9e99a48a9960b14926bb7f3b02e22da2b0ab7280"