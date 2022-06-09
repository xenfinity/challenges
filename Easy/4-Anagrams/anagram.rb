class Anagram
  attr_reader :comparison_string

  def initialize(comparison_string)
    @comparison_string = comparison_string
  end

  def match(strings)
    strings.select do |string|
      anagram?(comparison_string, string)
    end
  end

  private

  def anagram?(string1, string2)
    string1 = string1.downcase
    string2 = string2.downcase
    
    return false if string1 == string2
    string1.chars.sort == string2.chars.sort
  end
end