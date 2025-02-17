## Conditional Expressions

A conditional expression uses the value of a boolean expression to select one of two values.

The syntax of a conditional expression is as follows:

    condition ? true_val : false_val

If condition is true then the result is true_val. If condition is false then the result is false_val.

A common use of conditional expressions is to define defaults to replace invalid values:
      example:
        var.a != "" ? var.a : "default-a"
If var.a is an empty string then the result is "default-a", but otherwise it is the actual value of var.a.

# For Expressions

A `for` expression creates a complex type value by transforming another complex type value.

For example, if `var.list` were a list of strings, then the following expression would produce a tuple of strings with all-uppercase letters:

```text
[for s in var.list : upper(s)]

# Input Types
A for expression's input (given after the in keyword) can be a list, a set, a tuple, a map, or an object.
     syntax 
      [for k, v in var.map : length(k) + length(v)]
  example
      [for i, v in var.list : "${i} is ${v}"]

# Result Types
The type of brackets around the for expression decide what type of result it produces.
   if you provide  [ and ], which produces a tuple. If you use { and } instead, the result is an object and you must provide 
    two result expressions that are separated by the => symbol:
              {for s in var.list : s => upper(s)}

# Filtering Elements
A for expression can also include an optional if clause to filter elements from the source collection, producing a value with fewer elements than the source value:
          [for s in var.list : upper(s) if s != ""]

    example
            variable "users" {
                  type = map(object({
                    is_admin = bool
                  }))
                }
                
                locals {
                  admin_users = {
                    for name, user in var.users : name => user
                    if user.is_admin
                  }
                  regular_users = {
                    for name, user in var.users : name => user
                    if !user.is_admin
                  }
                }
In the above example, if the input var.users is a map of objects where the objects each have an attribute is_admin then you may wish to produce separate maps with admin vs non-admin objects:

# Element Ordering
Because for expressions can convert from unordered types (maps, objects, sets) to ordered types (lists, tuples), Terraform must choose an implied ordering for the elements of an unordered collection.

      toset([for e in var.set : e.example])


Grouping Results
If the result type is an object (using { and } delimiters) then normally the given key expression must be unique across all elements in the result, or Terraform will return an error.
Sometimes the resulting keys are not unique, and so to support that situation Terraform supports a special grouping mode which changes the result to support multiple elements per key.
To activate grouping mode, add the symbol ... after the value expression. For example:

                    variable "users" {
                      type = map(object({
                        role = string
                      }))
                    }
                    
                    locals {
                      users_by_role = {
                        for name, user in var.users : user.role => name...
                      }
                    }



Splat Expressions
A splat expression provides a more concise way to express a common operation that could otherwise be performed with a for expression.

            [for o in var.list : o.id]
            This is equivalent to the following splat expression:
            var.list[*].id

Terraform Function 
The Terraform language has a number of built-in functions that can be used in expressions to transform and combine values.
      <FUNCTION NAME>(<ARGUMENT 1>, <ARGUMENT 2>)
            min(55, 3453, 2)




          
          

        
