### Variables and Outputs
Terraform supports three kinds of variables
  
   # Input variable - are like function arguments.
 
  # Output variable - are like function return values.
 
  # Local variable - are like a function's temporary local variables.

 # Input Variables
    Input variables in Terraform allow you to parameterize your configurations, making them dynamic and adaptable to different scenarios. They are a key component of creating reusable and flexible infrastructure code. 

  # 1. Declare Input Variables:
      Declare input variables using the variable block in your Terraform configuration files. You can specify the variable's name, type, description, and even a default value if needed.

            variable "region" {
            description = "The AWS region where resources will be deployed."
            type        = string
            default     = "us-east-1"
          }

  #  2. Use Input Variables:

    You can use input variables throughout your Terraform configuration by referencing them using the var keyword.2. Use Input Variables:

You can use input variables throughout your Terraform configuration by referencing them using the var keyword.

        resource "aws_instance" "example" {
        ami           = "ami-12345678"
        instance_type = "t2.micro"
        subnet_id     = var.subnet_id
        availability_zone = var.region
      }

  # 3. Provide Input Values:

    When applying your Terraform configuration, you need to provide values for your input variables. There are several ways to provide input values:

            Using command-line flags: terraform apply -var="subnet_id=subnet-12345678"
            Using environment variables: TF_VAR_subnet_id=subnet-12345678 terraform apply
            Using a variable file: Create a .tfvars file (e.g., variables.tfvars) and pass it using the -var-file flag: terraform apply -var-file="variables.tfvars"
  # 4. Variable Precedence:

    Terraform follows a specific order of precedence for variable values. If a variable is defined in multiple places (default value, command-line input, variable file, etc.), Terraform uses the following order of priority:

        Environment variables (TF_VAR_ prefix)
        Command-line flags
        Variable files
        Default values in the configuration
  # 5. Using Input Variables with Modules:

      When working with modules, you can pass input variables from the parent module to the child module. This allows you to configure the behavior of the module based on your specific needs.

  # 6. Complex Data Types:

    Input variables can be of various types, including string, number, bool, list, map, object, and tuple. This allows you to handle different kinds of data and configurations.

Type constraints are created from a mixture of type keywords and type constructors. The supported type keywords are:

    string
    number
    bool
The type constructors allow you to specify complex types such as collections:

    list(<TYPE>)
    set(<TYPE>)
    map(<TYPE>)
    object({<ATTR NAME> = <TYPE>, ... })
    tuple([<TYPE>, ...])

7. Plan and Apply:

Before applying your Terraform configuration, Terraform will show you the values of the input variables that will be used. This helps you review and confirm the changes before applying them.

Using input variables effectively promotes modularity, reusability, and adaptability in your Terraform configurations, making your infrastructure code more maintainable and scalable.