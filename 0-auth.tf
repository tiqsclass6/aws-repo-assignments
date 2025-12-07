terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.24.0"
    }
  }

  backend "s3" {
    bucket  = "s3-static-site-files"
    key     = "espana/espana.tfstate"
    region  = "eu-south-2"
    encrypt = true
  }
}