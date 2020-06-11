# Testing

## ExUnit

Elixir’s built-in test framework is ExUnit and it includes everything we need to thoroughly test our code. Before moving on it is important to note that tests are implemented as Elixir scripts so we need to use the `.exs` file extension.

Before we can run our tests we need to start ExUnit with `ExUnit.start()`, this is most commonly done in `test/test_helper.exs`.

```elixir
defmodule ExampleTest do
  use ExUnit.Case
  doctest Example

  test "greets the world" do
    assert Example.hello() == :world
  end
end
```

Run tests with `mix tests`.

```
..

Finished in 0.03 seconds
2 tests, 0 failures
```

### `assert`

In some frameworks `should` or `expect` fill the role of `assert`.

We use the `assert` macro to test that the expression is true. In the event that it is not, an error will be raised and our tests will fail.

```elixir
defmodule ExampleTest do
  use ExUnit.Case
  doctest Example

  test "greets the world" do
    assert Example.hello() == :word
  end
end
```

Tests fail and we see something different:

```
1) test greets the world (ExampleTest)
     test/example_test.exs:5
     Assertion with == failed
     code:  assert Example.hello() == :word
     left:  :world
     right: :word
     stacktrace:
       test/example_test.exs:6 (test)

.

Finished in 0.03 seconds
2 tests, 1 failures
```

ExUnit will tell us exactly where our failed assertions are, what the expected value was, and what the actual value was.

### `refute`

`refute` is to `assert` as `unless` is to `if`. Use `refute` when you want to ensure a statement is always false.

### `assert_raise`

Sometimes it may be necessary to `assert` that an error has been raised. We can do this with `assert_raise`.

##  Test Setup

In some instances it may be necessary to perform setup before our tests. To accomplish this we can use the `setup` and `setup_all` macros. `setup` will be run before each test and `setup_all` once before the suite. It is expected that they will return a tuple of `{:ok, state}`, the state will be available to our tests.

```elixir
defmodule ExampleTest do
  use ExUnit.Case
  doctest Example

  setup_all do
    {:ok, recipient: :world}
  end

  test "greets", state do
    assert Example.hello() == state[:recipient]
  end
end
```

## Mocking

The simple answer to mocking in Elixir is: don’t. You may instinctively reach for mocks but they are highly discouraged in the Elixir community and for good reason.

For a longer discussion there is [this excellent article](http://blog.plataformatec.com.br/2015/10/mocks-and-explicit-contracts/). The gist is, that instead of mocking away dependencies for testing (mock as a verb), it has many advantages to explicitly define interfaces (behaviors) for code outside your application and using Mock (as a noun) implementations in your client code for testing.

To switch the implementations in your application code, the preferred way is to pass the module as arguments and use a default value. If that does not work, use the built-in configuration mechanism. For creating these mock implementations, you don’t need a special mocking library, only behaviours and callbacks.
