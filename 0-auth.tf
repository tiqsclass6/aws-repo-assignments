terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.24.0"
    }
  }

  backend "s3" {
    bucket  = "class-7-state-files"
    key     = "12022025.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}