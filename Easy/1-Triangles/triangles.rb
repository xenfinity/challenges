class Triangle
  attr_reader :sides

  def initialize(*sides)
    @sides = sides
    throw ArgumentError.new "Invalid triangle lengths" unless valid_sides
  end

  def kind
    case number_of_equal_sides
    when 3 then 'equilateral'
    when 2 then 'isosceles'
    else 'scalene'
    end
  end

  private

  def valid_sides
    return false unless sides.size == 3
    return false if sides.any? { |side| side <= 0 }
    return false unless sides_equal?
    true
  end

  def sides_equal?
    temp_sides = sides.dup
    3.times do
      return false unless temp_sides[0] + temp_sides[1] > temp_sides[2]
      temp_sides.rotate!
    end
    true
  end

  def number_of_equal_sides
    unique_sides = sides.uniq.size
    case unique_sides
    when 1 then 3
    when 2 then 2
    else 0
    end
  end
  
end