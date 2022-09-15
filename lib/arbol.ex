defmodule Tree do
  @moduledoc """
  Struct of Module, this allo left, right and val

  this have functions related to change in tree behaviour
  """

  defstruct [
    :val,
    left: nil,
    right: nil
  ]

  @doc """
  return new tree with val equal the value get

  ### Examples
      iex> Tree.new(10)
      %Tree{left: nil, right: nil, val: 10}
  """
  def new(val) do
    struct(__MODULE__, val: val)
  end
end


defmodule TreeBalanced.Core do
  @moduledoc """
  Core of Tree Balanced this have function related to use of tree and re-order
  """

  alias Tree

  @doc """
  add to tree value or create new tree with value

  ### Examples
      iex> TreeBalanced.Core.add(nil, 10)
      %Tree{left: nil, right: nil, val: 10}
      iex> TreeBalanced.Core.add(TreeBalanced.Core.add(nil, 10), 20)
      %Tree{left: nil, right: %Tree{left: nil, right: nil, val: 20}, val: 10}

  """
  def add(nil, val), do: Tree.new(val)
  def add(%Tree{left: left, val: intern_val, right: right} = _tree, val) when intern_val <= val do
    %Tree{left: left, right: add(right, val), val: intern_val}
  end
  def add(%Tree{left: left, val: intern_val, right: right} = _tree, val) do
    %Tree{left: add(left, val), right: right, val: intern_val}
  end

  @doc """
  Check in tree count of nodes if tree is nil return zero

  ### Examples
      iex> TreeBalanced.Core.countNodes(TreeBalanced.Core.add(TreeBalanced.Core.add(nil, 10), 20))
      2

  """
  def countNodes(nil), do: 0
  def countNodes(%Tree{left: left, right: right} = _tree) do
    1 + countNodes(left) + countNodes(right)
  end
end


defmodule TreeBalanced do
  @moduledoc """
  Tree Balanced Fachade for Functions

  this have following common functions:
    - add/2 -> add val as node in tree
    - countNodes/1 -> count the value of current tree
  """

  alias TreeBalanced.Core

  @doc """
  add to tree value or create new tree with value

  ### Examples
      iex> TreeBalanced.add(10)
      %Tree{left: nil, right: nil, val: 10}
      iex> TreeBalanced.add(20, TreeBalanced.add(10))
      %Tree{left: nil, right: %Tree{left: nil, right: nil, val: 20}, val: 10}

  """
  def add(val, tree \\ nil), do: Core.add(tree, val)

  @doc """
  Check in tree count of nodes if tree is nil return zero

  ### Examples
      iex> TreeBalanced.countNodes(TreeBalanced.add(20, TreeBalanced.add(10)))
      2

  """
  def countNodes(tree), do: Core.countNodes(tree)
end
