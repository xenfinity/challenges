
module ScrabbleScores
  SCORES_TO_KEYS = {
    1 => %w(A E I O U L N R S T),
    2 => %w(D G),
    3 => %w(B C M P),
    4 => %w(F H V W Y),
    5 => %w(K),
    8 => %w(J X),
    10 => %w(Q Z)
  }

  SCORES = SCORES_TO_KEYS.each_with_object({}) do |(score, letters), scores|
             letters.each do |letter|
               scores[letter] = score
             end
           end
end

class Scrabble
  include ScrabbleScores
  attr_reader :word

  def initialize(word)
    @word = word ? word : ''
  end

  def self.score(word)
    Scrabble.new(word).score
  end

  def score
    letters = letterize(word)

    letters.reduce(0) do |word_score, letter|
      letter_score = score_letter(letter)
      word_score + letter_score
    end
  end

  private

  def letterize(word)
    word.upcase.chars
  end

  def score_letter(letter)
    SCORES[letter] ? SCORES[letter] : 0
  end
end
