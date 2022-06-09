class PerfectNumber

  def self.classify(number)
    if number < 1
      raise StandardError.new('Number must be positive')
    end

    case aliquot_sum(number) <=> number
    when -1 then 'deficient'
    when 1 then 'abundant'
    else 'perfect'
    end
  end

  class << self
    def aliquot_sum(number)
      divisors = divisors(number)
      divisors.sum
    end
  
    def divisors(number)
      divisors = [1]
      2.upto(number-1) do |counter|
        divisors << counter if number % counter == 0
      end
      divisors
    end
  end
end

p PerfectNumber.classify(13)