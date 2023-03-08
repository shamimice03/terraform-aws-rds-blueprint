resource "aws_db_subnet_group" "db_subnet_group" {
  name       = var.var.db_subnet_group_name
  subnet_ids = module.vpc.db_subnet_id

  tags = {
    Name = var.db_subnet_group_name
  }
}

resource "aws_db_instance" "this" {
  # Settings
  identifier = var.db_identifier

  # Availability and durability
  multi_az = var.multi_az

  ### Storage
  storage_type          = var.storage_type
  allocated_storage     = var.allocated_storage
  max_allocated_storage = var.max_allocated_storage


  # Engine options
  engine         = var.engine
  engine_version = var.engine_version

  # Instance configuration
  instance_class = var.instance_class




  # Credentials Settings
  username = var.db_master_username
  password = var.db_master_password


  # Database options
  db_name = var.db_name

  # Connectivity
  db_subnet_group_name       = var.db_subnet_group_name
<<<<<<<<< saved version
  vpc_security_group_ids     = var.db_security_groups
  publicly_accessible        = var.publicly_accessible
=========
  vpc_security_group_ids = var.db_security_groups
  publicly_accessible = var.publicly_accessible
  port = var.database_port
  
>>>>>>>>> local version
  skip_final_snapshot        = var.skip_final_snapshot
  deletion_protection        = var.deletion_protection
  db_backup_retention_period = var.db_backup_retention_period
}