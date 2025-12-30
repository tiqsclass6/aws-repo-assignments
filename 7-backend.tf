terraform {
  backend "s3" {
    bucket  = "class-7-state-files"
    key     = "12232025.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}