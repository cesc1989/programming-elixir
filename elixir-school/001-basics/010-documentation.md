# Documentation

Elixir treats documentation as a first-class citizen, offering various functions to access and generate documentation for your projects. The Elixir core provides us with many different attributes to annotate a codebase.


- `#` - For inline documentation.
- `@moduledoc` - For module-level documentation.
- `@doc` - For function-level documentation.

## Inline Documentation

Hash or pound.

```elixir
# Outputs 'Hello, chum.' to the console.
IO.puts("Hello, " <> "chum.")
```

## Documenting Modules

The `@moduledoc` _annotator_ allows for inline documentation at a module level. It typically sits just under the `defmodule` declaration at the top of a file.

```elixir
defmodule Greeter do
  @moduledoc """
  Provides a function `hello/1` to greet a human
  """

  def hello(name) do
    "Hello, " <> name
  end
end
```

We (or others) can access this module documentation using the h helper function within IEx.

```elixir
iex> h Greeter

                Greeter

Provides a function hello/1 to greet a human
```

## Documenting Functions

The `@doc` annotator allows for inline documentation at a function level. The `@doc` annotator sits just above the function it is annotating.

```elixir
defmodule Greeter do
  @moduledoc """
  ...
  """

  @doc """
  Prints a hello message

  ## Parameters

    - name: String that represents the name of the person.

  ## Examples

      iex> Greeter.hello("Sean")
      "Hello, Sean"

      iex> Greeter.hello("pete")
      "Hello, pete"

  """
  @spec hello(String.t()) :: String.t()
  def hello(name) do
    "Hello, " <> name
  end
end
```

Notice how you **can use markup within our documentation** and the terminal will render it? Apart from really being cool and a novel addition to Elixir’s vast ecosystem, it gets much more interesting when we look at ExDoc to generate HTML documentation on the fly.

## ExDoc

ExDoc is an official Elixir project. It produces HTML (HyperText Markup Language) and online documentation for Elixir projects.

[See rest of the section](https://elixirschool.com/en/lessons/basics/documentation/#exdoc).

## Best Practices

Adding documentation should be added within the Best practices guidelines of the language. Since Elixir is a fairly young language many standards are still to be discovered as the ecosystem grows. The community, however, tried to establish best practices.

To read more about best practices see [The Elixir Style Guide](https://github.com/niftyn8/elixir_style_guide).

- Always document a module.
- If you do not intend to document a module, do not leave it blank. Consider annotating the module `false`.

```elixir
defmodule Greeter do
  @moduledoc false

end
```

- When referring to functions within module documentation, use backticks.
- Separate any and all code one line under the `@moduledoc`
- Use Markdown within docs. It will make it easier to read either via IEx or ExDoc.

Try to include some code examples in your documentation. This allows you to generate automatic tests from the code examples found in a module, function, or macro with [ExUnit.DocTest](https://hexdocs.pm/ex_unit/ExUnit.DocTest.html). In order to do that, you need to invoke the `doctest/1` macro from your test case and write your examples according to some guidelines as detailed in the official documentation.
