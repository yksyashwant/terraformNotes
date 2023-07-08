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

# Create a VPC
resource "aws_default_vpc" "default_vpc" {
  #cidr_block = "10.0.0.0/16"

  tags = {
    Name = "default vpc"
  }
}
#use data source to get all the availability zones in region 
data "aws_availability_zones" "availability_zones" {}


#Create default subnet if its not exists
resource "aws_default_subnet" "default_subnet" {
  availability_zone = data.aws_availability_zones.availability_zones.names[0]

  tags = {
    Name = "default subnet"
  }

}
