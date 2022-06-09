# class RomanNumeral
#   NUMERALS = {
#     'M' => 1000,
#     'D' => 500,
#     'C' => 100,
#     'L' => 50,
#     'X' => 10,
#     'V' => 5,
#     'I' => 1
#   }

#   AMMEND = {
#     'D' => 'M',
#     'C' => 'D',
#     'L' => 'C',
#     'X' => 'L',
#     'V' => 'X',
#     'I' => 'V'
#   }

#   attr_reader :number

#   def initialize(number)
#     @number = number
#   end

#   def to_roman
#     roman_numeral = ''
#     temp_num = number.dup
#     repeat_count = 0

#     until temp_num == 0
#       NUMERALS.each do |letter, value|
#         next if value > temp_num
#         repeat_count = roman_numeral[-1] == letter ? repeat_count + 1 : 0 

#         roman_numeral << letter
#         roman_numeral = ammend_repeat(roman_numeral) if repeat_count == 3
#         roman_numeral = ammend_sandwich(roman_numeral)
#         temp_num -= value
#         break
#       end
#     end

#     roman_numeral
#   end

#   def ammend_repeat(numeral)
#     next_highest = AMMEND[numeral[-1]]
#     numeral[0...-3] << next_highest
#   end

#   def ammend_sandwich(numeral)
#     last_three = numeral[-3..-1]
#     return numeral unless last_three
#     first, second, third = last_three.chars
    
#     if first == third && AMMEND[second] == first
#       last_three = second + AMMEND[first]
#     end
#     numeral[0..-4] + last_three
#   end
# end

class RomanNumeral
  attr_accessor :number

  ROMAN_NUMERALS = {
    "I" => 1,
    "IV" => 4,
    "V" => 5,
    "IX" => 9,
    "X" => 10,
    "XL" => 40,
    "L" => 50,
    "XC" => 90,
    "C" => 100,
    "CD" => 400,
    "D" => 500,
    "CM" => 900,
    "M" => 1000
  }

  def initialize(number)
    @number = number
  end

  def to_roman
    roman_version = ''
    to_convert = number

    until to_convert == 0
      chosen_multiplier = nil
      chosen_value = 0

      ROMAN_NUMERALS.each do |_, value|
        current_multiplier = to_convert / value 
        next if current_multiplier == 0
        chosen_multiplier = current_multiplier unless chosen_multiplier

        if chosen_multiplier >= current_multiplier
          chosen_multiplier = current_multiplier 
          chosen_value = value
        end
      end

      remainder = to_convert % chosen_value
      roman_version += (ROMAN_NUMERALS.key(chosen_value) * chosen_multiplier)
      to_convert = remainder
    end
    roman_version
  end
end