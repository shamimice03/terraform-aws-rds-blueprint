output "primary_db_identifier" {
  description = "The unique identifier for the primary DB instance"
  value       = module.primary_db.db_instance_id
}

output "replica_db_identifier" {
  description = "The unique identifier for the replica DB instance"
  value       = module.replica_db.db_instance_id
}

output "primary_db_endpoint" {
  description = "The connection endpoint of primary db in `address:port` format"
  value       = module.primary_db.db_instance_endpoint
}

output "replica_db_endpoint" {
  description = "The connection endpoint of replica db in `address:port` format"
  value       = module.replica_db.db_instance_endpoint
}

output "primary_db_address" {
  description = "The hostname of the primary db instance"
  value       = module.primary_db.db_instance_address
}

output "replica_db_address" {
  description = "The hostname of the replica db instance"
  value       = module.replica_db.db_instance_address
}

output "primary_db_port" {
  description = "The port number on which the primary DB instance accepts connections."
  value       = module.primary_db.db_instance_port
}

output "replica_db_port" {
  description = "The port number on which the replica DB instance accepts connections."
  value       = module.replica_db.db_instance_port
}

output "primary_db_class" {
  description = "The instance class of the primary DB instance."
  value       = module.primary_db.db_instance_class
}

output "replica_db_class" {
  description = "The instance class of the replica DB instance."
  value       = module.replica_db.db_instance_class
}

output "primary_db_engine" {
  description = "The name of the database engine to be used for primary DB instance."
  value       = module.primary_db.db_instance_engine
}

output "primary_db_engine_version" {
  description = "The version of the database engine to be used for the primary DB instance."
  value       = module.primary_db.db_instance_engine_version
}

output "primary_db_availability_zone" {
  description = "The availability zone of the primary DB instance"
  value       = module.primary_db.db_instance_availability_zone
}

output "replica_db_engine" {
  description = "The name of the database engine to be used for replica DB instance."
  value       = module.replica_db.db_instance_engine
}

output "replica_db_engine_version" {
  description = "The version of the database engine to be used for the replica DB instance."
  value       = module.replica_db.db_instance_engine_version
}

output "replica_db_availability_zone" {
  description = "The availability zone of the replica DB instance."
  value       = module.replica_db.db_instance_availability_zone
}

output "db_name" {
  description = "Name of the initial database"
  value       = module.primary_db.db_name
}

output "db_instance_username" {
  description = "The master username of the DB database"
  value       = module.primary_db.db_instance_username
  sensitive   = true
}

output "db_instance_password" {
  description = "The database password (this password might be old, because Terraform will not track password after initial creation)"
  value       = module.primary_db.db_instance_password
  sensitive   = true
}
