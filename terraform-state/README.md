State
Terraform must store state about your managed infrastructure and configuration. This state is used by Terraform to map real world resources to your configuration, keep track of metadata, and to improve performance for large infrastructures.
This state is stored by default in a local file named "terraform.tfstate
The primary purpose of Terraform state is to store bindings between objects in a remote system and resource instances declared in your configuration.


where to store the state file?
 - By default state files are stored in local.
 - usually we store the state file in remote location. or store them into s3 bucket.
 - we store them in remote location because multiple deveelopers can work on the same state file. it can be shared with multiple users or team. Rather than creeating multiple state file for multiple developers.

 How do you lock a state file? why we need to lock/secure statefile?
 - when two or more developers are running teerrafrom apply command at the same time this can causee inconsistance state.
 it can corrupt the state file as well. To prevent this we can enable the locking or lock the statefile.

what happen if a state file is lost?
- if a state file is lost then teerraform will forget all the resources which is already created but those resources will not be changed it will exists in real. 

what will happen if someone make the changes directly in aws console itself?
- terraform always try to match with real. if its removed then when you do terrafrom apply terraform will create the missing resources.

How do you import manually creeated resources into terraform?
- using import command we can do so.
    define the resources which you want to import
    then try to match the resource details from manually created.
    example:
            terraform import aws_vpc.test_vpc vpc-a01106c2







 Reference:
    https://developer.hashicorp.com/terraform/language/settings/backends/s3






