# Control Structures

## `if` and `unless`

In Elixir they work much the same way but they are defined as macros, not language constructs. You can find their implementation in the [Kernel module](https://hexdocs.pm/elixir/Kernel.html).

It should be noted that in Elixir, the only falsey values are `nil` and the boolean `false`.

```elixir
iex> if String.valid?("Hello") do
...>   "Valid string!"
...> else
...>   "Invalid string."
...> end
"Valid string!"

iex> if "a string value" do
...>   "Truthy"
...> end
"Truthy"

iex> unless is_integer("hello") do
...>   "Not an Int"
...> end
"Not an Int"
```

## `case`

```elixir
iex> case {:ok, "Hello World"} do
...>   {:ok, result} -> result
...>   {:error} -> "Uh oh!"
...>   _ -> "Catch all"
...> end
"Hello World"
```

The `_` variable is an important inclusion in `case/2` statements. Without it, failure to find a match will raise an error:

```elixir
iex> case :even do
...>   :odd -> "Odd"
...> end
** (CaseClauseError) no case clause matching: :even

iex> case :even do
...>   :odd -> "Odd"
...>   _ -> "Not Odd"
...> end
"Not Odd"
```

Consider `_` as the `else` that will match “everything else”.

Since `case/2` relies on pattern matching, all of the same rules and restrictions apply. If you intend to match against existing variables you must use the pin `^/1` operator:

```elixir
iex> pie = 3.14
 3.14
iex> case "cherry pie" do
...>   ^pie -> "Not so tasty"
...>   pie -> "I bet #{pie} is tasty"
...> end
"I bet cherry pie is tasty"
```

Another neat feature of `case/2` is its support for guard clauses:

```elixir
iex> case {1, 2, 3} do
...>   {1, x, 3} when x > 0 ->
...>     "Will match"
...>   _ ->
...>     "Won't match"
...> end
"Will match"
```

## `cond`

When we need to match conditions rather than values we can turn to `cond/1`; this is akin to `else if` or `elsif` from other languages:

```elixir
iex> cond do
...>   2 + 2 == 5 ->
...>     "This will not be true"
...>   2 * 2 == 3 ->
...>     "Nor this"
...>   1 + 1 == 2 ->
...>     "But this will"
...> end
"But this will"
```

Like `case/2`, `cond/1` will raise an error if there is no match. To handle this, we can define a condition set to true:

```elixir
iex> cond do
...>   7 + 1 == 0 -> "Incorrect"
...>   true -> "Catch all"
...> end
"Catch all"
```

## `with`

This looked nice but looks a bit advanced for now.

[`width` lesson in Elixir School](https://elixirschool.com/en/lessons/basics/control-structures/#with).