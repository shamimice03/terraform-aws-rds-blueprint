create_db_subnet_group = true
db_subnet_group_name   = "db-subnet-group"
db_subnets = [
  "subnet-043b349a428f5567d",
  "subnet-0fbfbd74af496858b",
  "subnet-0e65474a65478650f"
]
db_identifier      = "prod-db-01"
db_name            = "webapp_db"
db_master_username = "Admin"
# If `db_master_password` is not defined here, a `random` password will be created
db_master_password                  = "Superadmin123"
iam_database_authentication_enabled = true
multi_az                            = true
engine                              = "mysql"
engine_version                      = "8.0.28"
instance_class                      = "db.t3.micro"
# Storage
storage_type      = "gp2"
allocated_storage = "50"
# To enable storage autoscaling `max_allocated_storage` 
# Must be greater than or equal to allocated_storage or 0 to disable Storage Autoscaling.
max_allocated_storage = "50"

db_security_groups = [
  "sg-0f95984096003b7f5"
]
publicly_accessible             = false
database_port                   = 3306
backup_retention_period         = 7
backup_window                   = "03:00-05:00"
maintenance_window              = "Sat:05:00-Sat:07:00"
deletion_protection             = false
enabled_cloudwatch_logs_exports = ["audit", "error"]
apply_immediately               = true
delete_automated_backups        = true
skip_final_snapshot             = true