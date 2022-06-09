class BeerSong

  def self.verse(num)
    self.new.verse(num)
  end

  def self.verses(first, last)
    self.new.verses(first, last)
  end

  def verse(num)
    calculate_values(num)
    "#{first_line_num.capitalize} of beer on the wall, #{first_line_num} of beer.\n" \
    "#{second_line_start}, #{second_line_num} of beer on the wall.\n"
  end

  def verses(first, last)
    verses = ''
    first.downto(last) do |num|
      verses += verse(num)
      verses += "\n" unless num == last
    end
    verses
  end

  def self.lyrics
    verses(99, 0)
  end

  private

  attr_accessor :first_line_num, :second_line_num, :second_line_start

  def calculate_values(num)

    self.first_line_num = "#{num} bottles"
    self.second_line_start = "Take one down and pass it around"

    case num
    when 0 then no_bottles
    when 1 then one_bottle
    when 2 then self.second_line_num = "1 bottle"
    else self.second_line_num = "#{num-1} bottles"
    end
  end

  def no_bottles
    self.first_line_num = "no more bottles"
    self.second_line_start = "Go to the store and buy some more"
    self.second_line_num = "99 bottles"
  end

  def one_bottle
    self.first_line_num = "1 bottle"
    self.second_line_start = "Take it down and pass it around"
    self.second_line_num = "no more bottles"
  end
end

puts BeerSong.verses(99, 98)