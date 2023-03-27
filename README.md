
### Usage

```
module "rds_blueprint" {
  source  = "shamimice03/rds_blueprint/aws"
  
  create_db_subnet_group = true
  db_subnet_group_name = "db-subnet-group"
  db_subnets = [
      "subnet-0f5e0a9daf410e661",
      "subnet-0cb2441580936fb80",
      "subnet-0a698f3bc84f29ce8"
  ]
  db_identifier = "test-db-1"
  db_name = "mydb"
  db_master_username = "Admin"
  db_master_password = "Superadmin123"
  iam_database_authentication_enabled = true
  multi_az = false
  engine = "mysql"
  engine_version = "8.0"
  instance_class = "db.t3.micro"
  storage_type = "gp2"
  allocated_storage = "10"
  max_allocated_storage = "10"
  db_security_groups = [
    "sg-00dd287a4b2efc40c"
  ]
  publicly_accessible = false
  database_port = 3306
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