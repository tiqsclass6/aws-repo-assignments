terraform {
  required_version = ">= 1.6.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0.0"
    }
    local = {
      source  = "hashicorp/local"
      version = ">= 2.4.0"
    }
  }

  backend "s3" {
    bucket  = "class-7-state-files"
    key     = "12092025.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}
