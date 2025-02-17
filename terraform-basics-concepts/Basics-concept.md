# Terraform Overview

## 1. What is Terraform?
Terraform is an infrastructure as code tool that lets you define both cloud and on-prem resources in human-readable configuration files that you can version, reuse, and share. It is HashiCorp's infrastructure as code tool.

## 2. Terraform Key Concepts:

### Providers:
Providers are responsible for managing various types of infrastructure resources, such as AWS, Azure, Google Cloud, etc.

### Resources:
Resources are the individual infrastructure components you manage using Terraform, like virtual machines, databases, networks, etc.

### Variables:
Variables allow you to parameterize your configurations, making them more flexible and reusable.

### Modules:
Modules are reusable configurations that encapsulate a set of resources and can be used across different projects.

### State:
Terraform keeps track of the state of your infrastructure in a state file, which helps it understand the current state of your resources and what changes need to be applied.

### Plan and Apply:
Terraform's `plan` command shows you what changes will be made to your infrastructure before actually applying them using the `apply` command.

## 3. Terraform Basic Workflow

The core Terraform workflow consists of three stages:

- **Configuration**: Write your infrastructure code in Terraform's HCL syntax.
- **Initialization**: Run `terraform init` to download required providers and set up the environment.
- **Planning**: Run `terraform plan` to see what changes will be applied to your infrastructure.
- **Deployment**: Run `terraform apply` to apply the planned changes and create/update resources.
- **Management**: As your infrastructure evolves, you can update your code and apply changes using the same process.

Terraform's configuration language is declarative, meaning it describes the desired end-state for your infrastructure, in contrast to procedural programming languages that require step-by-step instructions. Terraform providers automatically calculate dependencies between resources to create or destroy them in the correct order.

## 4. Best Practices

- Use version control (like Git) to manage your Terraform code.
- Use variables and parameterization for flexibility.
- Divide your configurations into modules for reusability.
- Implement proper naming conventions for resources.
- Regularly back up and secure your Terraform state files.

## 5. Advantages of Using Terraform

- Terraform can manage infrastructure on multiple cloud platforms.
- The human-readable configuration language helps you write infrastructure code quickly.
- Terraform's state allows you to track resource changes throughout your deployments.
- You can commit your configurations to version control to safely collaborate on infrastructure.

## 6. How Does Terraform Work?

Terraform creates and manages resources using APIs. HashiCorp and the Terraform community have written thousands of providers to manage various resources and services. You can find all the providers on the Terraform Registry.

## 7. To Deploy Infrastructure with Terraform:

1. **Scope**: Identify the infrastructure for your project.
2. **Author**: Write the configuration for your infrastructure.
3. **Initialize**: Install the plugins Terraform needs to manage the infrastructure.
4. **Plan**: Preview the changes Terraform will make to match your configuration.
5. **Apply**: Make the planned changes.

## 8. What is a State File?

Terraform keeps track of your real infrastructure in a state file, which acts as a source of truth for your environment. Terraform uses this state file to determine the changes needed to match your configuration.

## 9. How to Install Terraform?

Follow the link to install Terraform:
[Terraform Installation Guide](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

## 10. Why Terraform?

The main purpose of Terraform is to declare resources, which represent infrastructure objects.

## 11. What is a Terraform Configuration?

A Terraform configuration is a complete document in the Terraform language that tells Terraform how to manage a given collection of infrastructure. A configuration can consist of multiple files and directories.

### Example of Terraform Configuration:

```hcl
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 1.0.4"
    }
  }
}

variable "aws_region" {}

variable "base_cidr_block" {
  description = "A /16 CIDR range definition, such as 10.1.0.0/16, that the VPC will use"
  default = "10.1.0.0/16"
}

variable "availability_zones" {
  description = "A list of availability zones in which to create subnets"
  type = list(string)
}

provider "aws" {
  region = var.aws_region
}

resource "aws_vpc" "main" {
  cidr_block = var.base_cidr_block
}

resource "aws_subnet" "az" {
  count = length(var.availability_zones)
  availability_zone = var.availability_zones[count.index]
  vpc_id = aws_vpc.main.id
  cidr_block = cidrsubnet(aws_vpc.main.cidr_block, 4, count.index+1)
}


References:
HashiCorp's official documentation
Terraform with EC2 instance tutorial
Terraform Associate Certification Tutorials
Terraform Language Documentation
Write Configuration Files tutorial