# Functions and Modules

## Anonymus Functions in Elixir

Start with keyword `fn` and end with keyword `end`.

```elixir
iex> add = fn a, b -> a + b end
iex> add.(1, 2)
e
```

**NOTICE**

The dot `.` between the variable `add` and parenthesis is required when invoking anonymous functions.

### First Class Citizens

In Elixir, functions are First Class Citizens. This means they can be passed as arguments to other functions.

```elixir
iex> is_function(add)
true
```

### Closures

Anonymous functions are Closures. Named functions aren't.

Being closures means they can access variables that are in the scope when the function is defined.

> See [closures definition](https://developer.mozilla.org/en/docs/Web/JavaScript/Closures) in MDN.

### Short Lived

After we exit the interactive shell, anonymous functions are no longer availanble. For long live functions use modules.

## Modules

With modules you're able to group several functions together.

> See file `003-a-module.ex`

In order to create your own modules in Elixir, use the `defmodule` macro, then use the `def` macro to define functions in that module. So in this case the module is Math and the function is sum.

Once this is saved the file can be compiled by typing elixirc into the terminal followed by the file name.

```
$ elixirc learn-elixir-notes/003-a-module.ex
```

In `iex`:

```elixir
iex> Math.sum(2,2)
4
```