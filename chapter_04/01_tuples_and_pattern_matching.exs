# You can use tuples in pattern matching

{status, count, action} = {:ok, 42, "next"}

IO.puts status
IO.puts count
IO.puts action
