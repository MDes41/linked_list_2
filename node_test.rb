require "minitest/autorun"
require 'minitest/pride'
require_relative 'node'
require_relative 'test_helper'


class NodeTest < Minitest::Test
  def test_that_node_has_data
    n = Node.new('deep')

    assert_equal "deep", n.data
  end

  def test_that_single_node_next_node_is_nil
    n = Node.new("dep")

    assert_equal nil, n.next_node
  end


end
