
variable "create_db_subnet_group" {
  description = "Whether to create db a subnet group"
  type        = bool
  default     = false
}

variable "db_subnet_group_name" {
  description = "Name of DB Subnet Group"
  type        = string
  default     = null
}

variable "db_subnet_group_description" {
  description = "Description of DB Subnet Group"
  type        = string
  default     = null
}

variable "db_subnets" {
  description = "List of DB subnets"
  type        = list(any)
  default     = []
}

variable "availability_zone" {
  description = "The AZ for the RDS instance"
  type        = string
  default     = null
}

variable "random_password_length" {
  description = "Length of the random password"
  type        = number
  default     = 16
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
  description = <<EOF
  When configured, the upper limit to which Amazon RDS can automatically scale the storage of the DB instance.
  Configuring this will automatically ignore differences to allocated_storage.
  Must be greater than or equal to allocated_storage or 0 to disable Storage Autoscaling.
  EOF
  type        = string
  default     = "0"
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

variable "allow_major_version_upgrade" {
  description = "Indicates that major version upgrades are allowed. Changing this parameter does not result in an outage and the change is asynchronously applied as soon as possible."
  type        = bool
  default     = false
}

variable "auto_minor_version_upgrade" {
  description = "Indicates that minor engine upgrades will be applied automatically to the DB instance during the maintenance window. Defaults to true."
  type        = bool
  default     = true
}

variable "skip_final_snapshot" {
  description = "Determines whether a final DB snapshot is created before the DB instance is deleted"
  type        = bool
  default     = true
}

variable "storage_encrypted" {
  description = "Specifies whether the DB instance is encrypted. Note that if you are creating a cross-region read replica this field is ignored and you should instead declare kms_key_id with a valid ARN. The default is false if not specified"
  type        = bool
  default     = false
}

variable "kms_key_id" {
  description = "The ARN for the KMS encryption key. If creating an encrypted replica, set this to the destination KMS ARN"
  type        = string
  default     = null
}

variable "replicate_source_db" {
  description = "Specifies that this resource is a Replicate database, and to use this value as the source database. This correlates to the identifier of another Amazon RDS Database to replicate (if replicating within a single region) or ARN of the Amazon RDS Database to replicate (if replicating cross-region)"
  type        = string
  default     = null
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}
