# Notes and More

## Commands

- Open interactive shell with `iex`.
- Type `h` followed by function name to get documentation about it.

```elixir
iex(2)> h is_boolean

def is_boolean(term)                              

  @spec is_boolean(term()) :: boolean()

guard: true

Returns true if term is either the atom true or the atom false (i.e., a
boolean); otherwise returns false.

Allowed in guard tests. Inlined by the compiler.
```