class Octal
  attr_reader :num_digits

  def initialize(number)
    number = 0 unless valid_input?(number)
    @num_digits = number.to_i.digits
  end

  def to_decimal
    decimal = 0
    num_digits.each_with_index do |digit, index|
      power = 8**index
      decimal += (digit * power)
    end
    decimal
  end

  def valid_input?(number)
    number.chars.all? { |num| p num.match?(/[0-7]/)}
  end
end

