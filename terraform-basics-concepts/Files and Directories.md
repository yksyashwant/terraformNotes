# File Extension

Code in the Terraform language is stored in plain text files with the `.tf` file extension. There is also a JSON-based variant of the language that is named with the `.tf.json` file extension.

Files containing Terraform code are often called **configuration files**.

## Override Files

Terraform normally loads all of the `.tf` and `.tf.json` files within a directory and expects each one to define a distinct set of configuration objects. If two files attempt to define the same object, Terraform returns an error.

In some rare cases, it is convenient to be able to override specific portions of an existing configuration object in a separate file.


# Example
If you have a Terraform configuration example.tf with the following contents:

    resource "aws_instance" "web" {
        instance_type = "t2.micro"
        ami           = "ami-408c7f28"
    }
..and you created a file override.tf containing the following:
    resource "aws_instance" "web" {
    ami = "foo"
    }
Terraform will merge the latter into the former, behaving as if the original configuration had been as follows:
    resource "aws_instance" "web" {
    instance_type = "t2.micro"
    ami           = "foo"
    }
    

# Dependency Lock File

A Terraform configuration may refer to two different kinds of external dependencies that come from outside of its own codebase:

- **Providers**, which are plugins for Terraform that extend it with support for interacting with various external systems.
- **Modules**, which allow splitting out groups of Terraform configuration constructs (written in the Terraform language) into reusable abstractions.

At present, the dependency lock file tracks only provider dependencies. Terraform does not remember version selections for remote modules, and so Terraform will always select the newest available module version that meets the specified version constraints. You can use an exact version constraint to ensure that Terraform will always select the same module version.

## Lock File Location

The lock file is always named `.terraform.lock.hcl`, and this name is intended to signify that it is a lock file for various items that Terraform caches in the `.terraform` subdirectory of your working directory.

Terraform automatically creates or updates the dependency lock file each time you run the `terraform init` command. The dependency lock file uses the same low-level syntax as the main Terraform language, but the dependency lock file is not itself a Terraform language configuration file. It is named with the suffix `.hcl` instead of `.tf` in order to signify that difference.

## Dependency Installation Behavior

When `terraform init` is working on installing all of the providers needed for a configuration, Terraform considers both the version constraints in the configuration and the version selections recorded in the lock file.

If a particular provider has no existing recorded selection, Terraform will select the newest available version that matches the given version constraint, and then update the lock file to include that selection.

## Checksum Verification

Terraform will also verify that each package it installs matches at least one of the checksums it previously recorded in the lock file, if any, returning an error if none of the checksums match:


## Error: Failed to install provider

Error while installing hashicorp/azurerm v2.1.0: the current package for
    registry.terraform.io/hashicorp/azurerm 2.1.0 doesn't match any of the
    checksums previously recorded in the dependency lock file.

This checksum verification is intended to represent a trust-on-first-use approach. When you add a new provider for the first time, you can verify it in whatever way you choose or any way you are required to by relevant regulations, and then trust that Terraform will raise an error if a future run of `terraform init` encounters a non-matching package for the same provider version.

### There are two special considerations with the "trust on first use" model:



    References
    https://developer.hashicorp.com/terraform/language/files/override
    https://developer.hashicorp.com/terraform/language/files/dependency-lock



