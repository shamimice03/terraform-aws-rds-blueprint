
variable "create_db_subnet_group" {
  description = "Whether to create db a subnet group"
  type        = bool
  default     = true
}

variable "db_subnet_group_name" {
  description = "Name of DB Subnet Group"
  type        = string
  default     = null
}

variable "db_subnets" {
  description = "List of DB subnets"
  type        = list(any)
  default     = []
}

variable "db_identifier" {
  description = "The name of the DB instance identifier."
  type        = string
  default     = null
}

variable "db_name" {
  description = "The database name"
  type        = string
  default     = null
}

variable "db_master_username" {
  description = "Master username for database"
  type        = string
  default     = null
}

variable "db_master_password" {
  description = "Master password for database"
  type        = string
  default     = null
  sensitive   = true
}

variable "iam_database_authentication_enabled" {
  description = <<EOF
  Specifies whether or not the mappings of AWS Identity and 
  Access Management (IAM) accounts to database accounts are enabled
  EOF
  type        = bool
  default     = false
}

variable "multi_az" {
  description = "Determine if the RDS instance is multi-AZ"
  type        = bool
  default     = false
}

variable "engine" {
  description = "The database engine to be used for the RDS instance."
  type        = string
  default     = null
}

variable "engine_version" {
  description = "The version of the database engine to be used for the RDS instance."
  type        = string
  default     = null
}

variable "instance_class" {
  description = "The instance class for the RDS instance."
  type        = string
  default     = null
}

variable "storage_type" {
  description = "Choose storage type from - gp2, gp3, io1"
  type        = string
  default     = "gp2"
}

variable "allocated_storage" {
  description = "The allocated storage in gigabytes"
  type        = string
  default     = "10"
}

variable "max_allocated_storage" {
  description = "To enable autosacling, define max_allocated_storage higher than the allocated_storage"
  type        = string
  default     = "10"
}

variable "db_security_groups" {
  description = "A list of security group IDs to associate with the DB instance"
  type        = list(string)
  default     = []
}

variable "publicly_accessible" {
  description = "Determine if the RDS instance is publicly_accessible"
  type        = bool
  default     = false
}

variable "database_port" {
  description = "The port on which the DB accepts connections."
  type        = number
  default     = null
}

variable "backup_retention_period" {
  description = "The number of days to retain automated backups"
  type        = number
  default     = 0
}

variable "backup_window" {
  description = "Must not overlap with maintenance_window"
  type        = string
  default     = null
}

variable "maintenance_window" {
  description = "The window to perform maintenance in."
  type        = string
  default     = null
}

variable "deletion_protection" {
  description = "Protect database from accidental deletion"
  type        = bool
  default     = false
}

variable "enabled_cloudwatch_logs_exports" {
  description = <<EOF
  Set of log types to enable for exporting to CloudWatch logs. 
  If omitted, no logs will be exported. Valid values (depending on engine). 
  MySQL and MariaDB: audit, error, general, slowquery.
  PostgreSQL: postgresql, upgrade. 
  MSSQL: agent , error. 
  Oracle: alert, audit, listener, trace.
  EOF
  type        = list(string)
  default     = []
}

variable "apply_immediately" {
  description = <<EOF
  Specifies whether any database modifications are applied immediately, 
  or during the next maintenance window.
  EOF
  type        = bool
  default     = false
}

variable "delete_automated_backups" {
  description = "Specifies whether to remove automated backups immediately after the DB instance is deleted."
  type        = bool
  default     = true
}

variable "skip_final_snapshot" {
  description = "Determines whether a final DB snapshot is created before the DB instance is deleted."
  type        = bool
  default     = true
}





# variable "db_parameter_group_name" {
#   description = "The name of the DB parameter group to use"
#   type        = string
# }









