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
  Takes a list of zoo animals and returns a new randomised list with the same elements

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

  @doc """
  see_animals  takes a list of zoo animals and the number of animals that you want to see and then returns a list

  ## Examples

      iex> zoo = Animals.create_zoo
      iex> Animals.see_animals(zoo, 2)
      ["monkey", "tiger"]
  """
  def see_animals(zoo, count) do
    # Enum.split returns a tuple so we have to pattern match on the result
    # to get the value we want out
    {_seen, to_see} = Enum.split(zoo, -count)
    to_see
  end

  @doc """
  Takes a list of zoo animals and a filename and saves the list to that file

  ## Examples

      iex> zoo = Animals.create_zoo
      iex> Animals.save(zoo, "my_animals")
      :ok
  """
  def save(zoo, filename) do
    # erlang is converting the zoo list to something that can be written to the file system
    binary = :erlang.term_to_binary(zoo)
    File.write(filename, binary)
  end

  @doc """
  Takes a filename and return a list of animals if the file exists

  ## Examples

      iex> Animals.load("animales")
      ["lion", "tiger", "monkey"]

      iex> Animals.load("nofile")
      "File does not exist"
  """
  def load(filename) do
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, _reason} -> "File does not exist"
    end
  end

  @doc """
  Takes a number, creates a zoo, randomises it and returns a list of animals of length selected

  ## Examples

      iex> Animals.selection(2)
      ["lion", "tiger"]
  """
  def selection(number_of_animals) do
    Animals.create_zoo()
    |> Animals.randomise()
    |> Animals.see_animals(number_of_animals)
  end
end
