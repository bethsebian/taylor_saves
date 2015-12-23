require_relative 'taylor_saves'
require 'minitest/autorun'

class TaylorTest < Minitest::Test
  attr_reader :text

  def setup
    @text = Taylor.new('./swift_stats/test_mult_line.txt')
  end

  def test_it_can_read_multiple_lines
    expected = ["i", "said", "that", "s", "a", "lie", "chevy", "just", "a", "boy", "in", "a", "chevy", "truck", "i", "love", "chevy"]
    assert_equal expected, text.read_and_split_mult_lines
  end

  def test_it_can_count_words_from_multiple_lines
    expected = {"i"=>2, "said"=>1, "that"=>1, "s"=>1, "a"=>3, "lie"=>1, "chevy"=>3, "just"=>1, "boy"=>1, "in"=>1, "truck"=>1, "love"=>1}
    assert_equal expected, text.count_unique_words
  end

  def test_it_removes_a_and_is_s_an_to_that_the_from_winner
    expected = {"i"=>2, "said"=>1, "lie"=>1, "chevy"=>3, "just"=>1, "boy"=>1, "in"=>1, "truck"=>1, "love"=>1}
    assert_equal expected, text.count_unique_excluding_fillers
  end

  def test_finds_most_common_words_clean
    expected = "chevy (3)"
    assert_equal expected, text.find_most_common_word_excluding_fillers
  end
end

