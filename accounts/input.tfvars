environment            = "development"
vpc_cidr_block         = "172.1.0.0/16"
vpc_secondary_cidr_block  = ["172.2.0.0/27"]
vpc_availability_zones = ["us-east-1a", "us-east-1b"]
vpc_private_subnets    = ["172.1.0.0/17", "172.1.128.0/17"]
vpc_public_subnets     = ["172.2.0.0/28", "172.2.0.16/28"]
cluster_name           = "nodejs-app"
eks_oidc_thumbprint    = "9e99a48a9960b14926bb7f3b02e22da2b0ab7280"