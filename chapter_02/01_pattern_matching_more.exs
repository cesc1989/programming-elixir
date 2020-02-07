# Ignoring a value with underscore

[1, _, _] = [1, 2, 3]

# prints [1, 2, 3]
# Can only be used in Pattern Matching and not for expressions

# From the book:
# Joe Armstrong, Erlang's creator, compares the equals sign in Erlang to hat used in algebra.
# When you write the equation `x = a + 1`, you are not assigning `a + 1` to `x`. Instead
# you're simply asserting that the expressions `x` and `a + 1` have the same value.
