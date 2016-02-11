require "minitest/autorun"
require 'minitest/pride'
require_relative 'list'

class ListTest < Minitest::Test

  def test_that_head_is_create

    list = List.new('deep')

    assert_equal "deep", list.head.data
  end

  def test_that_it_finds_the_tail

    list = List.new('deep')

    assert_equal "deep", list.tail.data
  end

  def test_that_string_is_created_and_linked

    list = List.new('dep deep')

    assert_equal 'dep', list.head.data
    assert_equal 'deep', list.tail.data
  end

  def test_that_beat_is_added_to_the_end

    list = List.new('dep deep')
    list.append('pop')

    assert_equal 'pop', list.tail.data
    assert_equal 'dep', list.head.data
  end

  def test_that_two_beats_are_appended_to_list

    list = List.new('dep deep')
    list.append('stop drop')

    assert_equal 'drop', list.tail.data
  end

  def test_that_list_all_gives_the_whole_list_back

    list = List.new('first second')
    list.append('third')
    list.append('fourth fifth')

    assert_equal 'first second third fourth fifth', list.all
  end

  def test_that_prepend_adds_to_the_beginning_of_the_list
    list = List.new('third fourth')
    list.prepend('first second')

    assert_equal 'first second third fourth', list.all
  end

  def test_that_include_comes_back_with_the_included_beat
    list = List.new("yes yesss")

    assert list.include?('yesss')
    refute list.include?('no')
  end

  def test_that_pop_removes_last_two_beats
    list = List.new('stays here pop popalso')


    assert_equal 'pop popalso', list.pop(2)
    assert_equal 'stays here', list.all
  end

  def test_counts_the_number_of_beats
    list = List.new('one two three four')

    assert_equal 4, list.count
  end

  def test_insert_a_group_of_beats
    list = List.new('1 1 1 1 3 3 3 3')
    list.insert(4, '2 2 2 2')

    assert_equal '1 1 1 1 2 2 2 2 3 3 3 3', list.all
  end




end
