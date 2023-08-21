output "db_instance_id" {
  description = "The unique identifier for the DB instance."
  value       = aws_db_instance.this.id
}

output "db_instance_endpoint" {
  description = "The DNS address of the DB instance."
  value       = aws_db_instance.this.endpoint
}

output "db_instance_port" {
  description = "The port number on which the DB instance accepts connections."
  value       = aws_db_instance.this.port
}

output "db_instance_id" {
  description = "The name of the initial databased"
  value       = aws_db_instance.this.db_name
}

output "db_instance_security_groups" {
  description = "A list of security group IDs associated with the DB instance."
  value       = aws_db_instance.this.vpc_security_group_ids
}

output "db_instance_subnet_group" {
  description = "The name of the DB subnet group associated with the DB instance."
  value       = aws_db_instance.this.db_subnet_group_name
}

output "db_instance_storage_encrypted" {
  description = "Indicates whether storage encryption is enabled for the DB instance."
  value       = aws_db_instance.this.storage_encrypted
}

output "db_instance_storage_type" {
  description = "The storage type for the DB instance."
  value       = aws_db_instance.this.storage_type
}

output "db_instance_storage_size" {
  description = "The allocated storage size for the DB instance."
  value       = aws_db_instance.this.allocated_storage
}

output "db_instance_instance_class" {
  description = "The instance class of the DB instance."
  value       = aws_db_instance.this.instance_class
}

output "db_instance_engine" {
  description = "The name of the database engine to be used for this DB instance."
  value       = aws_db_instance.this.engine
}

output "db_instance_engine_version" {
  description = "The version of the database engine to be used for this DB instance."
  value       = aws_db_instance.this.engine_version
}

output "db_instance_maintenance_window" {
  description = "The maintenance window for the DB instance."
  value       = aws_db_instance.this.maintenance_window
}

output "db_instance_backup_window" {
  description = "The backup window for the DB instance."
  value       = aws_db_instance.this.backup_window
}

output "db_instance_backup_retention_period" {
  description = "The number of days to retain automated backups for the DB instance."
  value       = aws_db_instance.this.backup_retention_period
}

output "db_instance_publicly_accessible" {
  description = "Indicates whether the DB instance is publicly accessible."
  value       = aws_db_instance.this.publicly_accessible
}

output "db_instance_multi_az" {
  description = "Indicates whether the DB instance is configured with Multi-AZ deployment."
  value       = aws_db_instance.this.multi_az
}

output "db_instance_username" {
  description = "The master username for the database"
  value       = aws_db_instance.this.username
  sensitive   = true
}

output "db_instance_password" {
  description = "The database password (this password might be old, because Terraform will not track password after initial creation)"
  value       = aws_db_instance.this.password
  sensitive   = true
}

output "db_subnet_group_subnets" {
  description = "The IDs of the subnets associated with the subnet group for the created RDS database instance"
  value       = aws_db_subnet_group.db_subnet_group[0].subnet_ids
}

output "db_instance_arn" {
  description = "The arn of RDS instance"
  value       = aws_db_instance.this.arn
}

output "db_instance_availability_zone" {
  description = "The availability zone of the RDS instance"
  value       = aws_db_instance.this.availability_zone
}



