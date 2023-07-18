terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.8.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}


resource "aws_vpc" "main" {
  cidr_block       = "10.20.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "Learning"
    Location="Hyderabad"

  }
}

#storing state file in Remote Location
terraform {
  backend "s3" {
    bucket = "store-statefile"
    key = "terraform.tf.state"
    region = "ap-south-1"
    #create a DynamoDb and a table should have a LockID as a partation key and 
#rest is take care by terrafrom. it will allow only one person to apply at a time and other apply will be in queue
   # dynamodb_table = "state-lock"
  }
}





