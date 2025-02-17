# Expressions

Expressions refer to or compute values within a configuration. Expressions can be used in a number of places in the Terraform language, but some contexts limit which expression constructs are allowed, such as requiring a literal value of a particular type.

## Types and Values

The Terraform language uses the following types for its values:

- **string**: A sequence of Unicode characters representing some text, like `"hello"`.

**Example**:

variable "vpcname" {
  type    = string
  default = "myvpc"
}

## Number: a numeric value. The number type can represent both whole numbers like 15 and fractional values like 6.283185.
example:
      variable "sshport" {
        type    = number
        default = 22
      }

## Bool: a boolean value, either true or false. bool values can be used in conditional logic.
example: 
        variable "enabled" {
        default = true
      }

## list (or tuple): a sequence of values, like ["us-west-1a", "us-west-1c"]. Elements in a list or tuple are identified by consecutive whole numbers, starting         with zero.
    example:
    variable "mylist" {
        type = list(string)
        default = ["Value1", "Value2"]
    }

## map (or object): a group of values identified by named labels, like {name = "Mabel", age = 52}.
      example 
      variable "mymap" {
          type = map
          default = {
              Key1 = "Value1"
              Key2 = "Value2"
          }
      }


## Strings, numbers, and bools are sometimes called primitive types. Lists/tuples and maps/objects are sometimes called complex types, structural types, or collection types.

# Finally, there is one special value that has no type:

    null: a value that represents absence or omission. If you set an argument of a resource to null, Terraform behaves as though you had completely omitted it — it will use the argument's default value if it has one, or raise an error if the argument is mandatory. null is most useful in conditional expressions, so you can dynamically omit an argument if a condition isn't met.

# Conversion of Primitive Types
    The Terraform language will automatically convert number and bool values to string values when needed, and vice-versa as long as the string contains a valid representation of a number or boolean value.

        true converts to "true", and vice-versa
        false converts to "false", and vice-versa
        15 converts to "15", and vice-versa

# Conversion of Complex Types
    Whenever possible, Terraform converts values between similar kinds of complex types if the provided value is not the exact type requested. "Similar kinds" is defined as follows:
            Objects and maps are similar.
            Tuples and lists are similar.
            Sets are almost similar to both tuples and lists:

# Interpolation
A ${ ... } sequence is an interpolation, which evaluates the expression given between the markers, converts the result to a string if necessary, and then inserts it into the final string:
      example
            "Hello, ${var.name}!"
# Directives
A %{ ... } sequence is a directive, which allows for conditional results and iteration over collections, similar to conditional and for expressions.
The following directives are supported:

    The %{if <BOOL>}/%{else}/%{endif} directive chooses between two templates based on the value of a bool expression:
              Example
                "Hello, %{ if var.name != "" }${var.name}%{ else }unnamed%{ endif }!"
    The %{for <NAME> in <COLLECTION>} / %{endfor} directive iterates over the elements of a given collection or structural value and evaluates a given template once for each element, concatenating the results together:
            example:
                        <<EOT
                        %{ for ip in aws_instance.example.*.private_ip }
                        server ${ip}
                        %{ endfor }
                        EOT
#Heredoc Strings
  Terraform also supports a "heredoc" style of string literal inspired by Unix shell languages, which allows multi-line strings to be expressed more clearly.
  example"
        <<EOT
          hello
          world
          EOT

# A heredoc string consists of:
    An opening sequence consisting of:
    A heredoc marker (<< or <<- — two less-than signs, with an optional hyphen for indented heredocs)
    A delimiter word of your own choosing
    A line break
    The contents of the string, which can span any number of lines
    The delimiter word you chose, alone on its own line (with indentation allowed for indented heredocs)


# References to Named Values
    Terraform makes several kinds of named values available. Each of these names is an expression that references the associated value. You can use them as standalone expressions, or combine them with other expressions to compute new values.

# Types of Named Values
 The main kinds of named values available in Terraform are:

# Resources
<RESOURCE TYPE>.<NAME> represents a managed resource of the given type and name.

# Input Variables
var.<NAME> is the value of the input variable of the given name.
If the variable has a type constraint (type argument) as part of its declaration, Terraform will automatically convert the caller's given value to conform to the type constraint.

# Local Values
local.<NAME> is the value of the local value of the given name.
Local values can refer to other local values, even within the same locals block, as long as you don't introduce circular dependencies.

# Child Module Outputs
module.<MODULE NAME> is an value representing the results of a module block.
To access one of the module's output values, use module.<MODULE NAME>.<OUTPUT NAME>
  
# Data Sources
data.<DATA TYPE>.<NAME> is an object representing a data resource of the given data source type and name.   

# Filesystem and Workspace Info
terraform.workspace is the name of the currently selected workspace.
  example:
        module "example" {
          # ...
        
          name_prefix = "app-${terraform.workspace}"
        }

          
      


Lab Reference:
https://developer.hashicorp.com/terraform/tutorials/configuration-language/expressions?utm_source=WEBSITE&utm_medium=WEB_IO&utm_offer=ARTICLE_PAGE&utm_content=DOCS

