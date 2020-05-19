# Pipe Operator

The pipe operator `|>` passes the result of an expression as the first parameter of another expression

Function calls can get so embedded that they become difficult to follow. Take the following nested functions into consideration

```ruby
foo(bar(baz(new_function(other_function()))))
```

Elixir takes a pragmatic approach to this syntactical chaos by giving us the pipe operator. The pipe operator which looks like `|>` _takes the result of one expression, and passes it on_.

```elixir
other_function() |> new_function() |> baz() |> bar() |> foo(
```

The pipe takes the result on the left, and passes it to the right hand side.

## Examples

```elixir
iex> "Elixir rocks" |> String.split()
["Elixir", "rocks"]

iex> "Elixir rocks" |> String.upcase() |> String.split()
["ELIXIR", "ROCKS"]

iex> "elixir" |> String.ends_with?("ixir")
true
```

## Best Practices

If the arity of a function is more than 1, then make sure to use parentheses.

This doesn’t matter much to Elixir, but it matters to other programmers who may misinterpret your code.

**It does matter with the pipe operator though**.

```elixir
iex> "elixir" |> String.ends_with? "ixir"
warning: parentheses are required when piping into a function call.
For example:

  foo 1 |> bar 2 |> baz 3

is ambiguous and should be written as

  foo(1) |> bar(2) |> baz(3)

true
```