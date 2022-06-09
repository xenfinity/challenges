class SumOfMultiples
  attr_reader :set_of_numbers

  def initialize(*set_of_numbers)
    @set_of_numbers = set_of_numbers.empty? ? [3,5] : set_of_numbers
  end

  def self.to(num)
    self.new.to(num)
  end

  def to(num)
    sum = 0
    1.upto(num-1) do |number|
      set_of_numbers.each do |set_num|
        if number % set_num == 0
          sum += number 
          break
        end
      end
    end
    sum
  end

end
