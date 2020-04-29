# Documentation

When we created a new project with mix, it created a file for us called mix.exs which is referred to as the 'MixFile'. This file holds information about our project and its dependencies.

At the bottom of the file it gives us a function called deps which manages all of the dependencies in our project.

Install `ex_doc` to have great docs.

```elixir
defp deps do
  [
    {:ex_doc, "~> 0.21"}
  ]
end
```

Install with

```
$ mix deps.get
```

Generate docs with

```
$ mix docs
```

Go and see `./doc/index.html` in your web browser.
