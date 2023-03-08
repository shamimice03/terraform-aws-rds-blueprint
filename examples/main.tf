module "vpc" {

  source = "shamimice03/vpc/aws"

  vpc_name = "RDS_VPC"
  cidr     = "172.16.0.0/16"


  azs                = ["ap-northeast-1a", "ap-northeast-1c", "ap-northeast-1d"]
  public_subnet_cidr = ["172.16.0.0/20", "172.16.16.0/20", "172.16.32.0/20"]
  db_subnet_cidr     = ["172.16.48.0/20", "172.16.64.0/20", "172.16.80.0/20"]

  enable_dns_hostnames      = true
  enable_dns_support        = true
  enable_single_nat_gateway = false

  tags = {
    "Team" = "Platform-Team"
    "Env"  = "prod"
  }

}

resource "aws_security_group" "rds_security_group" {
  name_prefix = "rds_sg"
  vpc_id      = module.vpc.vpc_id

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["172.16.0.0/16"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["172.16.0.0/16"]
  }
}