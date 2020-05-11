# Basics

Notes from the [Basics Chapter](https://elixirschool.com/en/lessons/basics/basics/) in Elixir School.

## Data Types

### Integers

```elixir
iex> 255
255
```

### Floats

In Elixir, floating point numbers require a decimal after at least one digit; they have 64-bit double precision and support `e` for exponent values

```elixir
iex> 3.14
3.14
iex> .14
** (SyntaxError) iex:2: syntax error before: '.'
iex> 1.0e-10
1.0e-10
```

### Booleans

Elixir supports `true` and `false` as booleans; everything is truthy except for `false` and `nil`.

### Atoms

An atom is a constant whose name is its value. If you’re familiar with Ruby, these are synonymous with Symbols.

## Basic Operations

### Arithmetic

```elixir
iex> 2 + 2
4
iex> 2 - 1
1
iex> 2 * 5
10
iex> 10 / 5
2.0
```

If you need integer division or the division remainder (i.e., modulo), Elixir comes with two helpful functions to achieve this

```elixir
iex> div(10, 5)
2
iex> rem(10, 3)
1
```

### Boolean

Elixir provides the `||`, `&&`, and `!` boolean operators.

There are three additional operators whose first argument must be a boolean (`true` or `false`).

```elixir
iex> true and 42
42
iex> false or true
true
iex> not false
true
iex> 42 and true
** (ArgumentError) argument error: 42
iex> not 42
** (ArgumentError) argument error
```

> Note: Elixir’s `and` and `or` actually map to `andalso` and `orelse` in Erlang.

### Comparison

Elixir comes with all the comparison operators we’re used to: `==`, `!=`, `===`, !`==`, `<=`, `>=`, `<`, and `>`.

For strict comparison of integers and floats, use `===`.

An important feature of Elixir is that any two types can be compared; this is particularly useful in sorting. We don’t need to memorize the sort order, but it is important to be aware of it.

```elixir
number < atom < reference < function < port < pid < tuple < map < list < bitstring
```

This can lead to some interesting, yet valid comparisons you may not find in other languages.

```elixir
iex> :hello > 999
true
iex> {:hello, :world} > [1, 2, 3]
false
```

### String Interpolation

```elixir
iex> name = "Sean"
iex> "Hello #{name}"
"Hello Sean"
```

### String Concatenation

```elixir
iex> name = "Sean"
iex> "Hello " <> name
"Hello Sean"
```
