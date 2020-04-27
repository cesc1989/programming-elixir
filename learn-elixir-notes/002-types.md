# Basic Types & Truthiness

These are the 7 basic types in Elixir:

- integers
- floats
- booleans
- atoms
- strings
- lists
- tuples

## Numbers

```elixir
iex> 1 + 2
3
```

## Booleans

```elixir
iex> true
true
iex> false
false

iex(3)> is_boolean(true)
true
iex(4)> is_boolean(1)
false
iex(5)> 
```

### Truthiness: truthy and falsy

Elixir has the concept (as in Ruby) of "truthy" and "falsy" values. A value is **truthy** when it is neither `false` nor `nil`. A value is **falsy** when it is `false` or `nil`.

**NOTICE**

Elixir has functions like `and/2` that only work with booleans but also functions that work with these truthy/falsy values, like `&&/2` and `!/1`.

The syntax `<function_name>/<number>` is the convention used in Elixir to identify a function named `<function_name>` that takes `<number>` parameters. The value `<number>` is also referred to as the **function [arity](https://en.wikipedia.org/wiki/Arity)**.

In Elixir each function is identified univocally both by its name and its arity.

> See more about Elixir function [arity](https://culttt.com/2016/05/02/understanding-function-arity-elixir/).

We can check the truthiness of a value by using the `!/1` function twice.

Verifying truthy values

```elixir
iex(5)> !!true
true
iex(6)> !!5
true
iex(7)> !![1,2]
true
iex(8)> !!"foo"
true
```

Verifying falsy valies

```elixir
iex(9)> !!false
false
iex(10)> !!nil
false
```

## Atoms

Atoms are constants where their name is their _own value_ (other languages call these Symbols).

```elixir
iex(11)> :popeye
:popeye
```

`true` and `false` are atoms in Elixir. Names of _modules_ are also atoms. Atoms can be used to reference modules from Erlang libraries.

**NOTICE**

One popular use of atoms in Elixir is to use them as messages for pattern matching.

Let's say you have a function which processes an http request. The outcome of this process is either going to be a success or an error. You could therefore use atoms to indicate whether or not this process is successful.

```elixir
def process(file) do
  lines = file |> split_lines

  case lines do
    nil ->
      {:error, "failed to process file"}
    lines ->
      {:ok, lines}
  end
end
```

Function `process/1` will return a tuple response. If the result of the `process` is successful, it will return `{:ok, lines}`. However if it fails (e.g. returns nil) then it will return an error. This will allows us to pattern match on this result.

```elixir
{:ok, lines} = process('text.txt')
```

This is very useful when piping multiple methods together.

## Strings

Strings are surrounded by double quotes.

You can print a string using the `IO` module.

```elixir
iex(14)> h IO.puts

def puts(device \\ :stdio, item)                        

  @spec puts(device(), chardata() | String.Chars.t()) :: :ok

Writes item to the given device, similar to write/2, but adds a newline at the
end.

By default, the device is the standard output. It returns :ok if it succeeds.

## Examples

    IO.puts("Hello World!")
    #=> Hello World!
    
    IO.puts(:stderr, "error")
    #=> error
```

## Lists

Elixir uses square brackets to make a list. No more Arrays but Lists :smile:.

```elixir
iex> my_list = [1,2,3]
iex> my_list
[1,2,3]

iex> length(my_list)
3
```

Lists are enumerable and can use the Enum module to perform iterative functions such as mapping.

> See [this discussion](https://github.com/dwyl/learn-elixir/issues/39) about the meaning of enumerable in the context of Elixir.

## Tuples

Elixir uses curly brackets to make a tuple.

**NOTICE**

Tuples are similar to lists but **are not suited to data sets that need to be updated or added to regularly**.

```elixir
iex> tuple = {:ok, "hello"}
{:ok, "hello"}

# get element at index 1
iex> elem(tuple, 1)
"hello"

# get the size of the tuple
iex> tuple_size(tuple)
2
```

**NOTICE**

Tuples are not enumerable and there are far fewer functions available in the Tuple module. You can reference tuple values by index but you cannot iterate over them. If you must treat your tuple as a list, then convert it using `Tuple.to_list(your_tuple)`.

## Lists or Tuples?

If you need to iterate over the values use a List.

When dealing with large Lists or Tuples:

- Updating a list (adding or removing elements) is **fast**.
- Updating a tuple is **slow**.
- Reading from a list (getting its length or selecting an element) is **slow**.
- Reading a tuple is **fast**.

> See [lists vs tuples](http://stackoverflow.com/questions/31192923/lists-vs-tuples-what-to-use-and-when) in Stack Overflow.
