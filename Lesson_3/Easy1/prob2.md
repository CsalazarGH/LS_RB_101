1. What is `!=` and where should you use it?

`!=` is a logical operator which means "not equal to."
It should be used in conditional statements like:

`if x != 'string'
  # do something
  end

# This would only be evaluating if x is different from "string"
`

2. Put `!` before something like `!user_name`

A `!` before something negates that expression. Example:

```!true
   # => false

   !(true || true)
   # => false
              ```
