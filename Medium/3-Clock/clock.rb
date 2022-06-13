class Clock
  include Comparable
  attr_accessor :time, :hours, :minutes

  def initialize(hours, minutes)
    @hours = hours
    @minutes = minutes
    self.time = (hours * 60) + minutes
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
    self.time <=> other_clock.time
  end

  def self.at(hours, minutes = 0)
    self.new(hours, minutes)
  end

  def correct_time
    self.time += 1440 while time < 0
    self.time -= 1440 until time < 1440
  end
end