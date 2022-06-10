class Robot
  @@names = []
  attr_accessor :name

  def initialize
    @name = gen_name
  end

  def reset
    self.name = gen_name
  end

  private
  
  def gen_name
    name = ''
    loop do
      2.times do
        name << (65 + rand(26))
      end
      3.times do 
        name << rand(10).to_s
      end
      break unless @@names.include?(name)
      name = ''
    end

    @@names << name
    name
  end
end