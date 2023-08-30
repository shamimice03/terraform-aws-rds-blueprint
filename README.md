
### Usage

```hcl
module "rds" {
  source  = "shamimice03/rds-blueprint/aws"

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

  tags = {
    "DB_ID" : "test-db-1",
    "ENV" : "Dev"
  }
}
```


<!--## To-do-->
<!--- Enhanced Monitoring-->
<!--- Create CloudWatch Alarm-->
<!--- SNS Topic-->
<!--- Review Cost using Cost manager--><!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.0.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >= 3.4.3 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.14.0 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.5.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_db_instance.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_instance) | resource |
| [aws_db_subnet_group.db_subnet_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_subnet_group) | resource |
| [random_password.db_master_password](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allocated_storage"></a> [allocated\_storage](#input\_allocated\_storage) | The allocated storage in gigabytes | `string` | `"10"` | no |
| <a name="input_apply_immediately"></a> [apply\_immediately](#input\_apply\_immediately) | Specifies whether any database modifications are applied immediately,<br>  or during the next maintenance window. | `bool` | `false` | no |
| <a name="input_backup_retention_period"></a> [backup\_retention\_period](#input\_backup\_retention\_period) | The number of days to retain automated backups | `number` | `0` | no |
| <a name="input_backup_window"></a> [backup\_window](#input\_backup\_window) | Must not overlap with maintenance\_window | `string` | `null` | no |
| <a name="input_create_db_subnet_group"></a> [create\_db\_subnet\_group](#input\_create\_db\_subnet\_group) | Whether to create db a subnet group | `bool` | `false` | no |
| <a name="input_database_port"></a> [database\_port](#input\_database\_port) | The port on which the DB accepts connections. | `number` | `null` | no |
| <a name="input_db_identifier"></a> [db\_identifier](#input\_db\_identifier) | The name of the DB instance identifier. | `string` | `null` | no |
| <a name="input_db_master_password"></a> [db\_master\_password](#input\_db\_master\_password) | Master password for database | `string` | `null` | no |
| <a name="input_db_master_username"></a> [db\_master\_username](#input\_db\_master\_username) | Master username for database | `string` | `null` | no |
| <a name="input_db_name"></a> [db\_name](#input\_db\_name) | The database name | `string` | `null` | no |
| <a name="input_db_security_groups"></a> [db\_security\_groups](#input\_db\_security\_groups) | A list of security group IDs to associate with the DB instance | `list(string)` | `[]` | no |
| <a name="input_db_subnet_group_description"></a> [db\_subnet\_group\_description](#input\_db\_subnet\_group\_description) | Description of DB Subnet Group | `string` | `null` | no |
| <a name="input_db_subnet_group_name"></a> [db\_subnet\_group\_name](#input\_db\_subnet\_group\_name) | Name of DB Subnet Group | `string` | `null` | no |
| <a name="input_db_subnets"></a> [db\_subnets](#input\_db\_subnets) | List of DB subnets | `list(any)` | `[]` | no |
| <a name="input_delete_automated_backups"></a> [delete\_automated\_backups](#input\_delete\_automated\_backups) | Specifies whether to remove automated backups immediately after the DB instance is deleted. | `bool` | `true` | no |
| <a name="input_deletion_protection"></a> [deletion\_protection](#input\_deletion\_protection) | Protect database from accidental deletion | `bool` | `false` | no |
| <a name="input_enabled_cloudwatch_logs_exports"></a> [enabled\_cloudwatch\_logs\_exports](#input\_enabled\_cloudwatch\_logs\_exports) | Set of log types to enable for exporting to CloudWatch logs.<br>  If omitted, no logs will be exported. Valid values (depending on engine).<br>  MySQL and MariaDB: audit, error, general, slowquery.<br>  PostgreSQL: postgresql, upgrade.<br>  MSSQL: agent , error.<br>  Oracle: alert, audit, listener, trace. | `list(string)` | `[]` | no |
| <a name="input_engine"></a> [engine](#input\_engine) | The database engine to be used for the RDS instance. | `string` | `null` | no |
| <a name="input_engine_version"></a> [engine\_version](#input\_engine\_version) | The version of the database engine to be used for the RDS instance. | `string` | `null` | no |
| <a name="input_iam_database_authentication_enabled"></a> [iam\_database\_authentication\_enabled](#input\_iam\_database\_authentication\_enabled) | Specifies whether or not the mappings of AWS Identity and<br>  Access Management (IAM) accounts to database accounts are enabled | `bool` | `false` | no |
| <a name="input_instance_class"></a> [instance\_class](#input\_instance\_class) | The instance class for the RDS instance. | `string` | `null` | no |
| <a name="input_maintenance_window"></a> [maintenance\_window](#input\_maintenance\_window) | The window to perform maintenance in. | `string` | `null` | no |
| <a name="input_max_allocated_storage"></a> [max\_allocated\_storage](#input\_max\_allocated\_storage) | When configured, the upper limit to which Amazon RDS can automatically scale the storage of the DB instance.<br>  Configuring this will automatically ignore differences to allocated\_storage.<br>  Must be greater than or equal to allocated\_storage or 0 to disable Storage Autoscaling. | `string` | `"0"` | no |
| <a name="input_multi_az"></a> [multi\_az](#input\_multi\_az) | Determine if the RDS instance is multi-AZ | `bool` | `false` | no |
| <a name="input_publicly_accessible"></a> [publicly\_accessible](#input\_publicly\_accessible) | Determine if the RDS instance is publicly\_accessible | `bool` | `false` | no |
| <a name="input_random_password_length"></a> [random\_password\_length](#input\_random\_password\_length) | Length of the random password | `number` | `16` | no |
| <a name="input_skip_final_snapshot"></a> [skip\_final\_snapshot](#input\_skip\_final\_snapshot) | Determines whether a final DB snapshot is created before the DB instance is deleted. | `bool` | `true` | no |
| <a name="input_storage_type"></a> [storage\_type](#input\_storage\_type) | Choose storage type from - gp2, gp3, io1 | `string` | `"gp2"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to apply to resources | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_db_instance_address"></a> [db\_instance\_address](#output\_db\_instance\_address) | The hostname of the RDS instance. |
| <a name="output_db_instance_arn"></a> [db\_instance\_arn](#output\_db\_instance\_arn) | The arn of RDS instance |
| <a name="output_db_instance_availability_zone"></a> [db\_instance\_availability\_zone](#output\_db\_instance\_availability\_zone) | The availability zone of the RDS instance |
| <a name="output_db_instance_backup_retention_period"></a> [db\_instance\_backup\_retention\_period](#output\_db\_instance\_backup\_retention\_period) | The number of days to retain automated backups for the DB instance. |
| <a name="output_db_instance_backup_window"></a> [db\_instance\_backup\_window](#output\_db\_instance\_backup\_window) | The backup window for the DB instance. |
| <a name="output_db_instance_endpoint"></a> [db\_instance\_endpoint](#output\_db\_instance\_endpoint) | The connection endpoint in address:port format. |
| <a name="output_db_instance_engine"></a> [db\_instance\_engine](#output\_db\_instance\_engine) | The name of the database engine to be used for this DB instance. |
| <a name="output_db_instance_engine_version"></a> [db\_instance\_engine\_version](#output\_db\_instance\_engine\_version) | The version of the database engine to be used for this DB instance. |
| <a name="output_db_instance_id"></a> [db\_instance\_id](#output\_db\_instance\_id) | The unique identifier for the DB instance. |
| <a name="output_db_instance_instance_class"></a> [db\_instance\_instance\_class](#output\_db\_instance\_instance\_class) | The instance class of the DB instance. |
| <a name="output_db_instance_maintenance_window"></a> [db\_instance\_maintenance\_window](#output\_db\_instance\_maintenance\_window) | The maintenance window for the DB instance. |
| <a name="output_db_instance_multi_az"></a> [db\_instance\_multi\_az](#output\_db\_instance\_multi\_az) | Indicates whether the DB instance is configured with Multi-AZ deployment. |
| <a name="output_db_instance_password"></a> [db\_instance\_password](#output\_db\_instance\_password) | The database password (this password might be old, because Terraform will not track password after initial creation) |
| <a name="output_db_instance_port"></a> [db\_instance\_port](#output\_db\_instance\_port) | The port number on which the DB instance accepts connections. |
| <a name="output_db_instance_publicly_accessible"></a> [db\_instance\_publicly\_accessible](#output\_db\_instance\_publicly\_accessible) | Indicates whether the DB instance is publicly accessible. |
| <a name="output_db_instance_security_groups"></a> [db\_instance\_security\_groups](#output\_db\_instance\_security\_groups) | A list of security group IDs associated with the DB instance. |
| <a name="output_db_instance_storage_encrypted"></a> [db\_instance\_storage\_encrypted](#output\_db\_instance\_storage\_encrypted) | Indicates whether storage encryption is enabled for the DB instance. |
| <a name="output_db_instance_storage_size"></a> [db\_instance\_storage\_size](#output\_db\_instance\_storage\_size) | The allocated storage size for the DB instance. |
| <a name="output_db_instance_storage_type"></a> [db\_instance\_storage\_type](#output\_db\_instance\_storage\_type) | The storage type for the DB instance. |
| <a name="output_db_instance_subnet_group"></a> [db\_instance\_subnet\_group](#output\_db\_instance\_subnet\_group) | The name of the DB subnet group associated with the DB instance. |
| <a name="output_db_instance_username"></a> [db\_instance\_username](#output\_db\_instance\_username) | The master username for the database |
| <a name="output_db_name"></a> [db\_name](#output\_db\_name) | Name of the initial database |
| <a name="output_db_subnet_group_subnets"></a> [db\_subnet\_group\_subnets](#output\_db\_subnet\_group\_subnets) | The IDs of the subnets associated with the subnet group for the created RDS database instance |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
