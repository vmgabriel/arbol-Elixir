defmodule TreeBalancedTest do
  use ExUnit.Case
  doctest TreeBalanced
  doctest TreeBalanced.Core
  doctest Tree

  describe "add/2" do
    test "Add in Balanced Tree" do
      assert 2 == 2
    end
  end

  describe "countNodes/1" do
    test "Check Count Nodes" do
      assert TreeBalanced.countNodes(TreeBalanced.add(10)) == 1

      nodes = [10, 20, 30, 40]
      count_nodes = Enum.count(nodes)
      t = Enum.reduce(nodes, nil, fn node,tree -> TreeBalanced.add(node, tree) end)
      assert TreeBalanced.countNodes(t) == count_nodes
    end
  end
end
