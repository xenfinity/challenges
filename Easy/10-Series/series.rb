class Series
  attr_reader :string
  def initialize(string)
    @string = string
  end

  def slices(series_length)
    raise ArgumentError.new if string.size < series_length
    array_of_numbers = string.chars.map(&:to_i)
    array_of_numbers.each_cons(series_length).to_a
  end
end

