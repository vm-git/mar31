terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.61.0"
    }
  }
  backend "s3" {
    dynamodb_table = "terraform"
    bucket         = "vmterraforms3bkt"
    region         = "ap-south-1"
    key            = "remote/workspace-basic"
  }
}

provider "aws" {
  # Configuration options
  region = var.region
}