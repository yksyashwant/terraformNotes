terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>4.0"
    }
  }
}
# Configure the AWS Provider
provider "aws" {
  profile = "default"
  region  = "ap-south-1"
}