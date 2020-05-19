# Modules

Modules allow us to organize functions into a namespace. In addition to grouping functions, they allow us to define named and private functions.

```elixir
defmodule Example do
  def greeting(name) do
    "Hello #{name}."
  end
end

iex> Example.greeting "Sean"
"Hello Sean."
```

It is possible to nest modules in Elixir, allowing you to further namespace your functionality.

```elixir
defmodule Example.Greetings do
  def morning(name) do
    "Good morning #{name}."
  end

  def evening(name) do
    "Good night #{name}."
  end
end

iex> Example.Greetings.morning "Sean"
"Good morning Sean."
```

## Module Attributes

Module attributes are most commonly used as constants in Elixir.

```elixir
defmodule Example do
  @greeting "Hello"

  def greeting(name) do
    ~s(#{@greeting} #{name}.)
  end
end
```

It is important to note there are reserved attributes in Elixir. The three most common are:

- `moduledoc` — Documents the current module.
- `doc` — Documentation for functions and macros.
- `behaviour` — Use an OTP or user-defined behaviour.

## Structs

Structs are special maps with a defined set of keys and default values. A struct must be defined within a module, which it takes its name from. It is common for a struct to be the only thing defined within a module.

Structs [Chapter Lesson](https://elixirschool.com/en/lessons/basics/modules/#structs).

## Composition

Elixir provides us with a variety of different ways to interact with other modules.

### `alias`

Allows us to alias module names; used quite frequently in Elixir code

```elixir
defmodule Sayings.Greetings do
  def basic(name), do: "Hi, #{name}"
end

defmodule Example do
  alias Sayings.Greetings

  def greeting(name), do: Greetings.basic(name)
end

# Without alias

defmodule Example do
  def greeting(name), do: Sayings.Greetings.basic(name)
end
```

If there’s a conflict between two aliases or we just wish to alias to a different name entirely, we can use the `:as` option

```elixir
defmodule Example do
  alias Sayings.Greetings, as: Hi

  def print_message(name), do: Hi.basic(name)
end
```

### `import`

If we want to import functions rather than aliasing the module we can use `import`.

```elixir
iex> last([1, 2, 3])
** (CompileError) iex:9: undefined function last/1
iex> import List
nil
iex> last([1, 2, 3])
3
```

### Filtering

By default all functions and macros are imported but we can filter them using the `:only` and `:except` options.

To import specific functions and macros, we must provide the name/arity pairs to `:only` and `:except`. Let’s start by importing only the `last/1` function:

```elixir
iex> import List, only: [last: 1]
iex> first([1, 2, 3])
** (CompileError) iex:13: undefined function first/1
iex> last([1, 2, 3])
3

iex> import List, except: [last: 1]
nil
iex> first([1, 2, 3])
1
iex> last([1, 2, 3])
** (CompileError) iex:3: undefined function last/1
```

In addition to the name/arity pairs there are two special atoms, :functions and :macros, which import only `functions` and `macros` respectively:

```elixir
import List, only: :functions
import List, only: :macros
```

### `require`

We could use `require` to tell Elixir you’re going to use macros from other module. The slight difference with `import` is that it allows using macros, but not functions from the specified module.

```elixir
defmodule Example do
  require SuperMacros

  SuperMacros.do_stuff
end
```

### `use`

With the `use` macro we can enable another module to modify our current module’s definition. When we call `use` in our code we’re actually invoking the `__using__/1` callback defined by the provided module. The result of the `__using__/1` macro becomes part of our module’s definition.

[`use` macro](https://elixirschool.com/en/lessons/basics/modules/#use) lesson.

Note: `quote`, `alias`, `use`, `require` are macros used when we work with metaprogramming
