resource "aws_db_subnet_group" "db_subnet_group" {
  count   = var.create_db_subnet_group ? 1 : 0
  name       = coalesce(var.db_subnet_group_name, var.db_identifier)
  subnet_ids = var.db_subnets

  tags = {
    Name = var.db_subnet_group_name
  }
}


resource "aws_db_instance" "this" {
  # Identify DB instance
  identifier = var.db_identifier

  # Create Initial Database
  db_name = var.db_name

  # Credentials Settings
  username                            = var.db_master_username
  password                            = var.db_master_password
  iam_database_authentication_enabled = var.iam_database_authentication_enabled

  # Availability and durability
  multi_az = var.multi_az

  # Engine options
  engine         = var.engine
  engine_version = var.engine_version

  # DB Instance configurations
  instance_class = var.instance_class

  ### Storage
  storage_type          = var.storage_type
  allocated_storage     = var.allocated_storage
  max_allocated_storage = var.max_allocated_storage

  # Connectivity
  db_subnet_group_name   = var.create_db_subnet_group ? aws_db_subnet_group.db_subnet_group[0].id : null
  vpc_security_group_ids = var.db_security_groups
  publicly_accessible    = var.publicly_accessible
  port                   = var.database_port

  # Backup and Maintenance
  backup_retention_period = var.backup_retention_period
  backup_window           = var.backup_window
  maintenance_window      = var.maintenance_window
  deletion_protection     = var.deletion_protection

  # Monitoring
  enabled_cloudwatch_logs_exports = var.enabled_cloudwatch_logs_exports

  # Others
  apply_immediately        = var.apply_immediately
  delete_automated_backups = var.delete_automated_backups
  skip_final_snapshot      = var.skip_final_snapshot

  timeouts {
    create = "60m"
    delete = "60m"
    update = "60m"
  }
}