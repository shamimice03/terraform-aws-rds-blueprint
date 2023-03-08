resource "aws_db_subnet_group" "db_subnet_group" {
  name       = var.var.db_subnet_group_name
  subnet_ids = module.vpc.db_subnet_id

  tags = {
    Name = var.db_subnet_group_name
  }
}

resource "aws_db_instance" "this" {
  # Identify DB instanve
  identifier = var.db_identifier
  
  # Create Initial Databse
  db_name    = var.db_name
  
  # Credentials Settings
  username = var.db_master_username
  password = var.db_master_password
  iam_database_authentication_enabled = var.iam_database_authentication_enabled

  # Availability and durability
  multi_az = var.multi_az
  
  # Engine options
  engine         = var.engine
  engine_version = var.engine_version
  
  # DB Instance configuration
  instance_class = var.instance_class
  
  ### Storage
  storage_type          = var.storage_type
  allocated_storage     = var.allocated_storage
  max_allocated_storage = var.max_allocated_storage

  # Connectivity
  db_subnet_group_name   = var.db_subnet_group_name
  vpc_security_group_ids = var.db_security_groups
  publicly_accessible    = var.publicly_accessible
  port                   = var.database_port
  
  # Backup and Maintenance
  db_backup_retention_period = var.db_backup_retention_period
  backup_window              = var.backup_window
  maintenance_window         = var.maintenance_window
  deletion_protection = var.deletion_protection
  
  # Monitoring
  enabled_cloudwatch_logs_exports = var.enabled_cloudwatch_logs_exports
  
  # Others
  apply_immediately = true
  delete_automated_backups   = var.delete_automated_backups
  skip_final_snapshot = var.skip_final_snapshot
 
}