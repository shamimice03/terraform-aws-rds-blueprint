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


module "rds" {
  source = "shamimice03/rds-blueprint/aws"

  # DB Subnet Group
  create_db_subnet_group = true
  db_subnet_group_name   = "db-subnet-group"
  db_subnets             = module.vpc.db_subnet_id

  # Identify DB instance
  db_identifier = "test-db-1"

  # Create Initial Database
  db_name = "mydb"

  # Credentials Settings
  db_master_username                  = "Admin"
  db_master_password                  = "Superadmin123"
  iam_database_authentication_enabled = true

  # Availability and durability
  multi_az = false

  # Engine options
  engine         = "mysql"
  engine_version = "8.0"

  # DB Instance configurations
  instance_class = "db.t3.micro"

  # Storage
  storage_type          = "gp2"
  allocated_storage     = "10"
  max_allocated_storage = "10"

  # Connectivity
  db_security_groups  = [aws_security_group.rds_security_group.id]
  publicly_accessible = false
  database_port       = 3306

  # Backup and Maintenance
  backup_retention_period = 7
  backup_window           = "03:00-05:00"
  maintenance_window      = "Sat:05:00-Sat:07:00"
  deletion_protection     = false

  # Monitoring
  enabled_cloudwatch_logs_exports = ["audit", "error"]

  # Others
  apply_immediately        = true
  delete_automated_backups = true
  skip_final_snapshot      = true

}