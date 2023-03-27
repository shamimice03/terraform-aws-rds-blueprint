
### Usage

```hcl
module "rds_blueprint" {
  source  = "shamimice03/rds_blueprint/aws"
  
  # DB Subnet Group
  create_db_subnet_group = true
  db_subnet_group_name = "db-subnet-group"
  db_subnets = [
      "subnet-0f5e0a9daf410e661",
      "subnet-0cb2441580936fb80",
      "subnet-0a698f3bc84f29ce8"
  ]
  
  # Identify DB instance
  db_identifier = "test-db-1"

  # Create Initial Database
  db_name = "mydb"
  
  # Credentials Settings
  db_master_username = "Admin"
  db_master_password = "Superadmin123"
  iam_database_authentication_enabled = true
  
  # Availability and durability
  multi_az = false
  
  # Engine options
  engine = "mysql"
  engine_version = "8.0"
  
  # DB Instance configurations
  instance_class = "db.t3.micro"
  
  # Storage
  storage_type = "gp2"
  allocated_storage = "10"
  max_allocated_storage = "10"
  
  # Connectivity
  db_security_groups = [
    "sg-00dd287a4b2efc40c"
  ]
  publicly_accessible = false
  database_port = 3306
  
  # Backup and Maintenance
  backup_retention_period = 7
  backup_window = "03:00-05:00"
  maintenance_window = "Sat:05:00-Sat:07:00"
  deletion_protection = false
  
  # Monitoring
  enabled_cloudwatch_logs_exports = ["audit", "error"]
  
  # Others
  apply_immediately = true
  delete_automated_backups = true
  skip_final_snapshot = true

}
```


<!--## To-do-->
<!--- Enhanced Monitoring-->
<!--- Create CloudWatch Alarm-->
<!--- SNS Topic-->
<!--- Review Cost using Cost manager-->