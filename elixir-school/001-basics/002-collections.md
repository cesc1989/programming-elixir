# Collections

Notes from [Collections Chapter](https://elixirschool.com/en/lessons/basics/collections/).

## Lists

Lists are simple collections of values which may include multiple types; lists may also include non-unique values.

```elixir
iex> [3.14, :pie, "Apple"]
[3.14, :pie, "Apple"]
```

Elixir implements list collections as linked lists. This means that accessing the list length is an operation that will run in linear time (`O(n)`). For this reason, it is typically faster to prepend than to append.

```elixir
iex> list = [3.14, :pie, "Apple"]
[3.14, :pie, "Apple"]
# Prepending (fast)
iex> ["π" | list]
["π", 3.14, :pie, "Apple"]
# Appending (slow)
iex> list ++ ["Cherry"]
[3.14, :pie, "Apple", "Cherry"]
```

### List Concatenation

Using the `++/2` operator.

```elixir
iex> [1, 2] ++ [3, 4, 1]
[1, 2, 3, 4, 1]
```

### List Subtraction

Using the `--/2` operator. it’s safe to subtract a missing value.

```elixir
iex> ["foo", :bar, 42] -- [42, "bar"]
["foo", :bar]
````

Be mindful of duplicate values. For every element on the right, the first occurrence of it gets removed from the left.

```elixir
iex> [1,2,2,3,2,3] -- [1,2,3,2]
[2, 3]
```

List subtraction uses **strict comparison** to match the values.

```elixir
iex> [2] -- [2.0]
[2]
iex> [2.0] -- [2.0]
[]
```

### Head & Tail

When using lists, it is common to work with a list’s head and tail. The head is the list’s first element, while the tail is a list containing the remaining elements. Elixir provides two helpful functions, `hd` and `tl`, for working with these parts.

```elixir
iex> hd [3.14, :pie, "Apple"]
3.14
iex> tl [3.14, :pie, "Apple"]
[:pie, "Apple"]
```

## Tuples

Tuples are similar to lists, but are stored contiguously in memory. This makes accessing their length fast but modification expensive; the new tuple must be copied entirely to memory. Tuples are defined with curly braces.

```elixir
iex> {3.14, :pie, "Apple"}
{3.14, :pie, "Apple"}
```

It is common for tuples to be used as a mechanism to return additional information from functions.

```elixir
iex> File.read("path/to/existing/file")
{:ok, "... contents ..."}
iex> File.read("path/to/unknown/file")
{:error, :enoent}
```

## Keyword Lists

> Personal note: to me, these are a kind of Ruby Hashes.

Keyword lists and maps are the associative collections of Elixir. In Elixir, a keyword list is a special list of two-element tuples whose first element is an atom; they share performance with lists.

```elixir
iex> [foo: "bar", hello: "world"]
[foo: "bar", hello: "world"]
iex> [{:foo, "bar"}, {:hello, "world"}]
[foo: "bar", hello: "world"]
```

The three characteristics of keyword lists highlight their importance:

- Keys are atoms.
- Keys are ordered.
- Keys do not have to be unique.

For these reasons, keyword lists are most commonly used to pass options to functions. 

## Maps

In Elixir, maps are the “go-to” key-value store. Unlike keyword lists, they allow keys of any type and are un-ordered. You can define a map with the `%{}` syntax.

```elixir
iex> map = %{:foo => "bar", "hello" => :world}
%{:foo => "bar", "hello" => :world}
iex> map[:foo]
"bar"
iex> map["hello"]
:world
```

There is a special syntax for maps containing only atom keys:

```elixir
iex> %{foo: "bar", hello: "world"}
%{foo: "bar", hello: "world"}
iex> %{foo: "bar", hello: "world"} == %{:foo => "bar", :hello => "world"}
true
```

In addition, there is a special syntax for accessing atom keys.

```elixir
map = %{foo: "bar", hello: "world"}
%{foo: "bar", hello: "world"}
iex> map[:foo]
"bar"
iex> map.hello
"world"
```

Another interesting property of maps is that they provide their own syntax for updates (note: this creates a new map):

```elixir
iex> map = %{foo: "bar", hello: "world"}
%{foo: "bar", hello: "world"}
iex> %{map | foo: "baz"}
%{foo: "baz", hello: "world"}
```

> This syntax only works for updating a key that already exists in the map! If the key does not exist, a `KeyError` will be raised.

To create a new key, instead use `Map.put/3`.

```elixir
iex> map = %{hello: "world"}
%{hello: "world"}
iex> %{map | foo: "baz"}
** (KeyError) key :foo not found in: %{hello: "world"}
    (stdlib) :maps.update(:foo, "baz", %{hello: "world"})
    (stdlib) erl_eval.erl:259: anonymous fn/2 in :erl_eval.expr/5
    (stdlib) lists.erl:1263: :lists.foldl/3
iex> Map.put(map, :foo, "baz")
%{foo: "baz", hello: "world"}
```
