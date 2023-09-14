output "db_instance_id" {
  description = "The unique identifier for the DB instance"
  value       = try(aws_db_instance.this[0].id, null)
}

output "db_instance_endpoint" {
  description = "The connection endpoint in address:port format"
  value       = try(aws_db_instance.this[0].endpoint, null)
}

output "db_instance_address" {
  description = "The hostname of the RDS instance"
  value       = try(aws_db_instance.this[0].address, null)
}

output "db_instance_port" {
  description = "The port number on which the DB instance accepts connections"
  value       = try(aws_db_instance.this[0].port, null)
}

output "db_name" {
  description = "Name of the initial database"
  value       = try(aws_db_instance.this[0].db_name, null)
}

output "db_instance_security_groups" {
  description = "A list of security group IDs associated with the DB instance"
  value       = try(aws_db_instance.this[0].vpc_security_group_ids, null)
}

output "db_instance_subnet_group" {
  description = "The name of the DB subnet group associated with the DB instance"
  value       = try(aws_db_instance.this[0].db_subnet_group_name, null)
}

output "db_instance_storage_encrypted" {
  description = "Indicates whether storage encryption is enabled for the DB instance"
  value       = try(aws_db_instance.this[0].storage_encrypted, null)
}

output "db_instance_storage_type" {
  description = "The storage type for the DB instance"
  value       = try(aws_db_instance.this[0].storage_type, null)
}

output "db_instance_storage_size" {
  description = "The allocated storage size for the DB instance"
  value       = try(aws_db_instance.this[0].allocated_storage, null)
}

output "db_instance_class" {
  description = "The instance class of the DB instance"
  value       = try(aws_db_instance.this[0].instance_class, null)
}

output "db_instance_engine" {
  description = "The name of the database engine to be used for this[0] DB instance"
  value       = try(aws_db_instance.this[0].engine, null)
}

output "db_instance_engine_version" {
  description = "The version of the database engine to be used for this[0] DB instance"
  value       = try(aws_db_instance.this[0].engine_version, null)
}

output "db_instance_maintenance_window" {
  description = "The maintenance window for the DB instance"
  value       = try(aws_db_instance.this[0].maintenance_window, null)
}

output "db_instance_backup_window" {
  description = "The backup window for the DB instance"
  value       = try(aws_db_instance.this[0].backup_window, null)
}

output "db_instance_backup_retention_period" {
  description = "The number of days to retain automated backups for the DB instance"
  value       = try(aws_db_instance.this[0].backup_retention_period, null)
}

output "db_instance_publicly_accessible" {
  description = "Indicates whether the DB instance is publicly accessible"
  value       = try(aws_db_instance.this[0].publicly_accessible, null)
}

output "db_instance_multi_az" {
  description = "Indicates whether the DB instance is configured with Multi-AZ deployment"
  value       = try(aws_db_instance.this[0].multi_az, null)
}

output "db_instance_username" {
  description = "The master username for the database"
  value       = try(aws_db_instance.this[0].username, null)
  sensitive   = true
}

output "db_instance_password" {
  description = "The database password (this[0] password might be old, because Terraform will not track password after initial creation)"
  value       = try(aws_db_instance.this[0].password, null)
  sensitive   = true
}

output "db_subnet_group_subnets" {
  description = "The IDs of the subnets associated with the subnet group for the created RDS database instance"
  value       = try(aws_db_subnet_group.db_subnet_group[0].subnet_ids, null)
}

output "db_instance_arn" {
  description = "The ARN of RDS instance"
  value       = try(aws_db_instance.this[0].arn, null)
}

output "db_instance_availability_zone" {
  description = "The availability zone of the RDS instance"
  value       = try(aws_db_instance.this[0].availability_zone, null)
}
