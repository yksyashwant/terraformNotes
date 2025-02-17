## State

Terraform must store state about your managed infrastructure and configuration. This state is used by Terraform to map real-world resources to your configuration, keep track of metadata, and improve performance for large infrastructures.  
By default, this state is stored in a local file named `terraform.tfstate`.

The primary purpose of Terraform state is to store bindings between objects in a remote system and resource instances declared in your configuration.

### Where to Store the State File?

- By default, state files are stored locally.
- Usually, we store the state file in a remote location, such as an S3 bucket.
- Storing the state file remotely allows multiple developers to work on the same state file, sharing it with multiple users or teams, rather than creating multiple state files for different developers.

### How Do You Lock a State File? Why Do We Need to Lock/Secure the State File?

- When two or more developers run the `terraform apply` command at the same time, it can cause an inconsistent state.  
This can corrupt the state file as well. To prevent this, we can enable state file locking to secure the file.

### What Happens if a State File is Lost?

- If a state file is lost, Terraform will forget all the resources that were created. However, those resources will still exist in the real world and won't be changed.

### What Will Happen if Someone Makes Changes Directly in the AWS Console?

- Terraform always tries to match with the real state. If resources are removed manually (e.g., through the AWS console), when you run `terraform apply`, Terraform will create the missing resources again.

### How Do You Import Manually Created Resources into Terraform?

You can use the `import` command to import resources into Terraform:
1. Define the resources you want to import.
2. Match the resource details with the manually created resources.

Example:
```bash
terraform import aws_vpc.test_vpc vpc-a01106c2



 Reference:
    https://developer.hashicorp.com/terraform/language/settings/backends/s3






