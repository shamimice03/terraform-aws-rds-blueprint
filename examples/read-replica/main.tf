module "vpc" {
  source = "shamimice03/vpc/aws"

  vpc_name = "RDS_VPC"
  cidr     = "172.17.0.0/16"

  azs                = ["ap-northeast-1a", "ap-northeast-1c"]
  public_subnet_cidr = ["172.17.0.0/20", "172.17.16.0/20"]
  db_subnet_cidr     = ["172.17.32.0/20", "172.17.48.0/20"]

  enable_dns_hostnames      = true
  enable_dns_support        = true
  enable_single_nat_gateway = false

  tags = {
    "Team" = "platform-team"
    "Env"  = "dev"
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

locals {
  db_subnet_group_name                = "db-subnet-group"
  db_identifier                       = "test-db-1"
  replica_db_identifier               = "test-db-1-replica-1"
  db_name                             = "mydb"
  db_master_username                  = "Admin"
  db_master_password                  = "Superadmin123"
  engine                              = "mysql"
  engine_version                      = "8.0"
  instance_class                      = "db.t3.micro"
  storage_type                        = "gp2"
  allocated_storage                   = "20"
  max_allocated_storage               = "20"
  iam_database_authentication_enabled = false
  multi_az                            = false
  publicly_accessible                 = false
  deletion_protection                 = false
  database_port                       = 3306
  backup_retention                    = 7
  backup_window                       = "03:00-05:00"
  maintenance_window                  = "Sat:05:00-Sat:07:00"
  enabled_cloudwatch_logs_exports     = ["audit", "error"]
  ca_cert_identifier                  = "rds-ca-ecc384-g1"
  apply_immediately                   = true
  delete_automated_backups            = true
  skip_final_snapshot                 = true

  general_tags = {
    "Project_name" = "aws-rds"
    "Team"         = "platform-team"
    "Env"          = "dev"
  }
}

module "primary_db" {
  source = "../../"

  # DB Subnet Group
  create_db_subnet_group = true
  db_subnet_group_name   = local.db_subnet_group_name
  db_subnets             = module.vpc.db_subnet_id

  # Identify DB instance
  db_identifier = local.db_identifier

  # Create Initial Database
  db_name = local.db_name

  # Credentials Settings
  db_master_username                  = local.db_master_username
  db_master_password                  = local.db_master_password
  iam_database_authentication_enabled = local.iam_database_authentication_enabled

  # Availability and durability
  multi_az          = local.multi_az
  availability_zone = "ap-northeast-1a"

  # Engine options
  engine         = local.engine
  engine_version = local.engine_version

  # DB Instance configurations
  instance_class = local.instance_class

  # Storage
  storage_type          = local.storage_type
  allocated_storage     = local.allocated_storage
  max_allocated_storage = local.max_allocated_storage

  # Connectivity
  db_security_groups  = [aws_security_group.rds_security_group.id]
  publicly_accessible = local.publicly_accessible
  database_port       = local.database_port

  # Backup and Maintenance
  backup_retention_period = local.backup_retention
  backup_window           = local.backup_window
  maintenance_window      = local.maintenance_window

  # Deletion protection
  deletion_protection = local.deletion_protection

  # Monitoring
  enabled_cloudwatch_logs_exports = local.enabled_cloudwatch_logs_exports

  # CA Cert
  ca_cert_identifier = local.ca_cert_identifier

  # Others
  apply_immediately        = local.apply_immediately
  delete_automated_backups = local.delete_automated_backups
  skip_final_snapshot      = local.skip_final_snapshot

  # Tags
  tags = merge(
    { "DB_ID" : local.db_identifier },
    local.general_tags,
  )
}


module "replica_db" {
  source = "../../"

  # Identify Primary DB instance
  replicate_source_db = local.db_identifier
  db_identifier       = local.replica_db_identifier

  # Availability and durability
  multi_az          = local.multi_az
  availability_zone = "ap-northeast-1a"

  # Engine options
  engine         = local.engine
  engine_version = local.engine_version

  # DB Instance configurations
  instance_class                      = local.instance_class
  iam_database_authentication_enabled = local.iam_database_authentication_enabled

  # Storage
  storage_type          = local.storage_type
  allocated_storage     = local.allocated_storage
  max_allocated_storage = local.max_allocated_storage

  # Connectivity
  db_security_groups  = [aws_security_group.rds_security_group.id]
  publicly_accessible = local.publicly_accessible
  database_port       = local.database_port

  # Backup and Maintenance
  backup_retention_period = local.backup_retention
  backup_window           = local.backup_window
  maintenance_window      = local.maintenance_window

  # Deletion protection
  deletion_protection = local.deletion_protection

  # Monitoring
  enabled_cloudwatch_logs_exports = local.enabled_cloudwatch_logs_exports

  # CA Cert
  ca_cert_identifier = local.ca_cert_identifier

  # Others
  apply_immediately        = local.apply_immediately
  delete_automated_backups = local.delete_automated_backups
  skip_final_snapshot      = local.skip_final_snapshot

  # Tags
  tags = merge(
    { "DB_ID" : local.replica_db_identifier },
    local.general_tags,
  )

  depends_on = [module.primary_db]
}
