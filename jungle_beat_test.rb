require_relative 'jungle_beat'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'test_helper'

class JungleBeatTest < MiniTest::Test
  def test_that_append_works
    jb = JungleBeat.new("addto")

    assert_equal 2, jb.append("added added")
    assert_equal "addto added added", jb.all
  end

  def test_that_prepend_works
    jb = JungleBeat.new("addto")

    assert_equal 2, jb.prepend("added added")
    assert_equal "added added addto", jb.all
  end

  def test_that_include_works
    jb = JungleBeat.new("beat beat include this beat")

    assert_equal true, jb.include?("include")
    #edge case, need to change code to include two beats
    assert_equal false, jb.include?("include this")
  end

  def test_that_pop_removes_some_beats
    jb = JungleBeat.new("beat beat beat remove all this")

    assert_equal "remove all this", jb.pop(3)
  end

  def test_that_count_works_to_count_all_the_beats
    jb = JungleBeat.new("this should have five beats")

    assert_equal 5, jb.count
  end

  def test_insert_works_to_put_beats_in
    jb = JungleBeat.new("this is the before this is the after")

    assert_equal "this is the before INSERT THIS this is the after", jb.insert(4, "INSERT THIS")
  end

  def test_that_find_works
    jb = JungleBeat.new("going to find THIS BEAT not this one")

    assert_equal "THIS BEAT", jb.find(3, 2)
  end
end
