defmodule Example do
  # A) when number of arguments is leser than the number of required parameters
  # there will be no match and thus an error.
  #
  # B) when number of arguments is equals to the number of required parameters
  # then required parameters take the values of the passed arguments
  #
  # C) when number of arguments is greater than the number of required parameters
  # then Elixir uses the exceding values to override default parameters
  #
  # Parameters are matched from left to the right
  def func(p1, p2 \\ 2, p3 \\ 3, p4) do
    IO.inspect [p1, p2, p3, p4]
  end

  # Placing this definition here causes a CompileError because prior definition
  # matches:
  # func/2, func/3 and func/4
  def func(p1, p2) do

  end
end
