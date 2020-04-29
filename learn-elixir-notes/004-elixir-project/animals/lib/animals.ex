defmodule Animals do
  @moduledoc """
  Documentation for Animals.

  methods:
    - create_zoo
    - randomize
    - contains?
  """

  @doc """
  create_zoo returns a list of zoo animals

  ## Examples

      iex> Animals.create_zoo
      ["lion", "tiger", "monkey"]

  """
  def create_zoo do
    ["lion", "tiger", "monkey"]
  end

  @doc """
  randomise takes a list of zoo animals and returns a new randomised list with the same elements

  ## Examples
      iex> zoo = Animals.create_zoo
      iex> Animals.randomise(zoo)
      ["monkey", "lion", "tiger"]
  """
  def randomise(zoo) do
    Enum.shuffle(zoo)
  end

  @doc """
  contains? taks a list of zoo animals and a single animal and returns a boolean
  as to whether or not the list contains the given animal.

  ## Examples
      iex> zoo = Animals.create_zoo
      iex> Animals.contains?(zoo, "gorilla")
      false
  """
  def contains?(zoo, animal) do
    Enum.member?(zoo, animal)
  end
end
