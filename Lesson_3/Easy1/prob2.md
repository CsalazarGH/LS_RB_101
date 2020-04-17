
1. What is `!=` and where should you use it?

`!=` is a logical operator which means "not equal to."
It should be used in conditional statements like:

```ruby
  if x != 'string'
  # do something
  end

# This would only be evaluating if x is different from "string"
```

2. Put `!` before something like `!user_name`

A `!` before something negates that expression. Example:

```ruby
   !true
   # => false

   !(true || true)
   # => false
```


3. Put `!` after something, like `words.uniq!`

This exclamation point (or `bang`) is pure convention.
In Ruby, it is usual that destructive methods end with an `!`, and that's what happens here with the `uniq!` method.
This exclamation point is a part of the method's name, and
adding `!` to a method will not make it destructive!

4. Put `?` before something

The `?` is used as in the ternary operator syntax.

```ruby
puts 3 > 2 ? "3 is greater!" : "2 is greater"
# => 3 is greater
```

5. Put `?` after something
  A question mark at the end of a name is syntax convention in ruby, which implies that the method returns a boolean value.

  ```ruby
    false.true?
    # => false
  ```

6. Put `!!` before something, like `!!user_name`

Putting `!!` before an expression is used to return the truthiness value of the expression

```ruby
  x = false
  !!x
  # => false
  ```
