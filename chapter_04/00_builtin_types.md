# Elixir Built-in Types

- Value types:
  - Arbitrary-sized integers
  - Floating-point numbers
  - Atoms
  - Ranges
  - Regular expressions

- System types:
  - PIDs and ports
  - References

- Collection types:
  - Tuples
  - Lists
  - Maps
  - Binaries

# Value Types

## Atoms

> Atoms are constants that represent something's name.

> An atom's name is its value. Two atoms with the same name will always compare as being equal, even if they were created by different applications on two computers separated by an ocean.

# Collection Types

## Tuples

> A tuple is an ordered collection of values. As with all Elixir data structures, once created a tuple cannot be modified.

```elixir
{ 1, 2 } { :ok, 42, "next" } { :error, :enoent }
```

> A typical Elixir tuple has two to four elements--any more and you'll probably want to look at maps or structs.

## Lists

> Instead, a list is effectively a linked data structure. A list may either be empty or consist of a head and a tail. The head contains a value and the tail is itself a list.

> [...] this recursive definition of a list is the core of much Elixir programming.
