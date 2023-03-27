terraform {
  required_version = ">= 0.13"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.57.1"
    }

    random = {
      source  = "hashicorp/random"
      version = ">= 3.4.3"
    }
  }
}

# provider "aws" {
#   profile = "terraform-user"
# }