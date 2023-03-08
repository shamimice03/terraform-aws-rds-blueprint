
variable "db_identifier" {
  type        = string
  description = "The name of the DB instance or clutser identifier."
  default     = ""
}

#### Storage ####
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


#########################################

variable "dbname" {
  description = "The database name"
  type        = string
  default     = "mydb"
}

variable "engine" {
  description = "The database engine to be used for the RDS instance."
  type        = string
  default     = "mysql"
}

variable "engine_version" {
  description = "The version of the database engine to be used for the RDS instance."
  type        = string
  default     = "5.7"
}

variable "instance_class" {
  description = "The instance class for the RDS instance."
  type        = string
  default     = "db.t3.micro"
}

#### DB Subnet Group ####

variable "db_subnets" {
  description = "List of DB subnets"
  type        = list(any)
  default     = []
}

variable "db_subnet_group_name" {
  description = "Name of DB Subnet Group"
  type        = string
  default     = "db-subnet-group"
}

#########################################

variable "db_backup_retention_period" {
  description = "The number of days to retain automated backups"
  type        = number
  default     = 7
}

variable "backup_window" {
  description = "Must not overlap with maintenance_window"
  type        = string
  default     = "03:00-05:00"
}

variable "maintenance_window" {
  description = "The window to perform maintenance in."
  type        = string
  default     = "Sat:03:00-Sat:05:00"
}


variable "delete_automated_backups" {
  description = "Specifies whether to remove automated backups immediately after the DB instance is deleted."
  type        = bool
  default     = true
}

variable "deletion_protection" {
  description = "Protect database from accidental deletion"
  type        = bool
  default     = false
}

variable "skip_final_snapshot" {
  description = "True for skipping final snapshot"
  type        = bool
  default     = true
}

variable "multi_az" {
  description = "Determine if the RDS instance is multi-AZ"
  type        = bool
  default     = false
}

variable "publicly_accessible" {
  description = "Determine if the RDS instance is publicly_accessible"
  type        = bool
  default     = false
}

variable "database_port" {
  description = "The port on which the DB accepts connections."
  type        = number
  default     = 3306
}

variable "db_parameter_group_name" {
  description = "The name of the DB parameter group to use"
  type        = string
}


variable "db_security_groups" {
  description = "A list of security group IDs to associate with the DB instance"
  type        = list(string)
  default     = []
}

variable "db_master_username" {
  description = "Master username for database"
  type        = string
  default     = "Admin"
}

variable "db_master_password" {
  description = "Master password for database."
  type        = string
  default     = "Admin@123"
  sensitive   = true
}


variable "enabled_cloudwatch_logs_exports" {
  description = <<DESC
  Set of log types to enable for exporting to CloudWatch logs. 
  If omitted, no logs will be exported. Valid values (depending on engine). 
  MySQL and MariaDB: audit, error, general, slowquery.
  PostgreSQL: postgresql, upgrade. 
  MSSQL: agent , error. 
  Oracle: alert, audit, listener, trace.
  DESC
  type        = list(string)
  default     = []
}