# Enum

Chapter [Enum](https://elixirschool.com/en/lessons/basics/enum/) in Elixir School.

> A set of algorithms for enumerating over enumerables.
>
> The Enum module includes over 70 functions for working with enumerables. All the collections that we learned about in the previous lesson, with the exception of tuples, are enumerables.
>
> Enumeration is at the core of functional programming, and combined with other perks of Elixir it can be incredibly empowering for developers.

Review:

```elixir
iex> h Enum
iex> h Stream
```

## `all?`

When using `all?/2`, and much of `Enum`, we supply a function to apply to our collection's items. In the case of `all?/2`, the entire collection must evaluate to `true` otherwise `false` will be returned:

```elixir
iex> Enum.all?(["foo", "bar", "hello"], fn(s) -> String.length(s) == 3 end)
false
iex> Enum.all?(["foo", "bar", "hello"], fn(s) -> String.length(s) > 1 end)
true
```

## `any?`

Function `any?/2` will return `true` if at least one item evaluates to `true`.

```elixir
iex> Enum.any?(["foo", "bar", "hello"], fn(s) -> String.length(s) == 5 end)
true
```

## `chunk_every`

Break your collection up into smaller groups with `chunk_every/2`.

```elixir
iex> Enum.chunk_every([1, 2, 3, 4, 5, 6], 2)
[[1, 2], [3, 4], [5, 6]]
```

## `chunk_by`

Group a collection based on something other than size using `chunk_by/2`.

It takes a given enumerable and a function, and when the return on that function changes a new group is started and begins the creation of the next.

```elixir
iex> Enum.chunk_by(["one", "two", "three", "four", "five"], fn(x) -> String.length(x) end)
[["one", "two"], ["three"], ["four", "five"]]
iex> Enum.chunk_by(["one", "two", "three", "four", "five", "six"], fn(x) -> String.length(x) end)
[["one", "two"], ["three"], ["four", "five"], ["six"]]
```

## `each`

Iterate over a collection without producing a new value with `each/2`.

```elixir
iex> Enum.each(["one", "two", "three"], fn(s) -> IO.puts(s) end)
one
two
three
:ok
```

## `filter`

The `filter/2` function enables us to filter the collection to include only those elements that evaluate to `true` using the provided function.

```elixir
iex> Enum.filter([1, 2, 3, 4], fn(x) -> rem(x, 2) == 0 end)
[2, 4]
```

## `reduce`

With `reduce/3` we can distill our collection down into a single value.

To do this we supply an optional accumulator (`10` in this example) to be passed into our function; if no accumulator is provided the first element in the enumerable is used.

```elixir
iex> Enum.reduce([1, 2, 3], 10, fn(x, acc) -> x + acc end)
16

iex> Enum.reduce([1, 2, 3], fn(x, acc) -> x + acc end)
6

iex> Enum.reduce(["a","b","c"], "1", fn(x,acc)-> x <> acc end)
"cba1"
```

## `sort`

Sorting our collections is made easy with not one, but two, sorting functions.

`sort/1` uses Erlang's [term ordering](http://erlang.org/doc/reference_manual/expressions.html#term-comparisons) to determine the sorted order.

```elixir
iex> Enum.sort([5, 6, 1, 3, -1, 4])
[-1, 1, 3, 4, 5, 6]

iex> Enum.sort([:foo, "bar", Enum, -1, 4])
[-1, 4, Enum, :foo, "bar"]
```

`sort/2` allows us to provide a custom sorting function.

```elixir
# with our function
iex> Enum.sort([%{:val => 4}, %{:val => 1}], fn(x, y) -> x[:val] > y[:val] end)
[%{val: 4}, %{val: 1}]

# without
iex> Enum.sort([%{:count => 4}, %{:count => 1}])
[%{count: 1}, %{count: 4}]
```

## `uniq`

We can use `uniq/1` to remove duplicates from our enumerables:

```elixir
iex> Enum.uniq([1, 2, 3, 2, 1, 1, 1, 1, 1])
[1, 2, 3]
```

## `unique_by`

`uniq_by/2` also removes duplicates from enumerables, but it allows us to provide a function to do the uniqueness comparison.

```elixir
iex> Enum.uniq_by([%{x: 1, y: 1}, %{x: 2, y: 1}, %{x: 3, y: 3}], fn coord -> coord.y end)
[%{x: 1, y: 1}, %{x: 3, y: 3}]
```