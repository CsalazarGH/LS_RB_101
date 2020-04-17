Question #9

Consider these two methods:

```ruby
def foo(param = "no")
  "yes"
end

def bar(param = "no")
  param == "no" ? "yes" : "no"
end
```

What would be the return value of the following method invocation?

`bar(foo)`

My answer before checking: `bar(foo)` will return `"no"`

Correct answer: `bar(foo)` will return `"no"`

`bar(foo)` returns "no" because the `foo` method will return "yes" with any
string as the argument or even with no argument.

When you pass `"yes"` as the argument to the `bar` method, it will evaluate a
boolean `param == "no" ?`. Since param will be equal to "yes", it will evaluate
to `false` and return `"no"`.
