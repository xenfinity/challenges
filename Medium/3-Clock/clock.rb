class Clock
  include Comparable
  
  ONE_DAY = 24 * 60

  def initialize(hours, minutes)
    @time = (hours * 60) + minutes
  end

  def to_s
    hour = (time / 60).to_s.rjust(2, '0')
    minute = (time % 60).to_s.rjust(2, '0')
    "#{hour}:#{minute}"
  end

  def +(num)
    self.time += num
    correct_time
    self
  end

  def -(num)
    self.time -= num
    correct_time
    self
  end

  def <=>(other_clock)
    time <=> other_clock.time
  end

  def self.at(hours, minutes=0)
    new(hours, minutes)
  end

  protected

  attr_accessor :time
  
  private

  def correct_time
    self.time += ONE_DAY while time < 0
    self.time -= ONE_DAY while time >= ONE_DAY
  end
end