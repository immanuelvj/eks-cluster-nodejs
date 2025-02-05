module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "nodejs-app-vpc"
  cidr = var.vpc_cidr_block
  secondary_cidr_blocks = var.vpc_secondary_cidr_block

  azs             = var.vpc_availability_zones
  private_subnets = var.vpc_private_subnets
  public_subnets  = var.vpc_public_subnets

  enable_dns_hostnames    = true
  enable_nat_gateway      = true
  single_nat_gateway      = false
  enable_vpn_gateway      = false
  map_public_ip_on_launch = false
  one_nat_gateway_per_az  = true

  default_security_group_ingress = [{ "from_port" : 443, "to_port" : 443, "protocol" : "tcp", cidr_blocks : "0.0.0.0/0" },{ "from_port" : 80, "to_port" : 80, "protocol" : "tcp", cidr_blocks : "0.0.0.0/0" }]
  default_network_acl_ingress    = [{ "action" : "allow", "cidr_block" : "0.0.0.0/0", "from_port" : 1024, "protocol" : "6", "rule_no" : 101, "to_port" : "65535" }, { "action" : "allow", "cidr_block" : "0.0.0.0/0", "from_port" : 443, "protocol" : "6", "rule_no" : 100, "to_port" : "443" }, { "action" : "allow", "from_port" : 443, "ipv6_cidr_block" : "::/0", "protocol" : "6", "rule_no" : 102, "to_port" : 443 },{ "action" : "allow", "from_port" : 80, "ipv6_cidr_block" : "0.0.0.0/0", "protocol" : "6", "rule_no" : 103, "to_port" : 80 }]
  default_network_acl_egress     = [{ "action" : "allow", "cidr_block" : "0.0.0.0/0", "from_port" : 1024, "protocol" : "6", "rule_no" : 101, "to_port" : "65535" }, { "action" : "allow", "cidr_block" : "0.0.0.0/0", "from_port" : 443, "protocol" : "6", "rule_no" : 100, "to_port" : "443" }, { "action" : "allow", "from_port" : 443, "ipv6_cidr_block" : "::/0", "protocol" : "6", "rule_no" : 102, "to_port" : 443 },{ "action" : "allow", "from_port" : 80, "ipv6_cidr_block" : "0.0.0.0/0", "protocol" : "6", "rule_no" : 103, "to_port" : 80 }]

  enable_flow_log                           = true
  create_flow_log_cloudwatch_iam_role       = true
  create_flow_log_cloudwatch_log_group      = true
  flow_log_cloudwatch_log_group_name_suffix = "nodejs-app"
  vpc_flow_log_tags = {
    Name        = "nodejs-app"
    Environment = var.environment
  }
  tags = {
    Service     = "nodejs-app"
    Environment = var.environment
  }
}
