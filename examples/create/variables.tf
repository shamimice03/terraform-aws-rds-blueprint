variable "tags" {
  description = "General tags to apply to resources created"
  type        = map(string)
  default = {
    "Project_name" = "aws-rds"
    "Team"         = "platform-team"
    "Env"          = "dev"
  }
}
