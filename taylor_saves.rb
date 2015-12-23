require 'csv'
require 'pry'

class Taylor
  attr_reader :file_path

  def initialize(file_path)
    @file_path = file_path
  end

  def read_and_split_mult_lines
    text_w_no_punctuation = IO.read(file_path).gsub(/[^a-z0-9\s]/i, ' ')
    text_w_no_punctuation.downcase.split
  end

  def count_unique_words
    words = read_and_split_mult_lines
    wf = words.group_by { |w| w }.map { |w, ws| [w, ws.length] }.to_h
  end

  def excluded_words
    %w[the a is an s to that]
  end

  def count_unique_excluding_fillers
    words = count_unique_words
    excluded_words.each { |word| words.delete(word) }
    words
  end

  def find_most_common_word_excluding_fillers
    word_count = count_unique_excluding_fillers
    winner = {}
    word_count.each do |word, count|
      if winner == {}
        winner[word] = count
      elsif winner[winner.keys.first] < count
        winner.delete(winner.keys.first)
        winner[word] = count
      else
      end
    end
    format_winner(winner)
  end

  def format_winner(winner)
    winner.keys.first + " (" + winner.values.first.to_s + ")"
  end

end