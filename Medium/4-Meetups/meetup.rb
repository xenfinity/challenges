require 'date'
class Meetup
  DAYS = {
    sunday: 0,
    monday: 1,
    tuesday: 2,
    wednesday: 3,
    thursday: 4,
    friday: 5,
    saturday: 6
  }

  SCHEDULE = {
    "first" => Array(1..7),
    "second" => Array(8..14),
    "third" => Array(15..21),
    "fourth" => Array(22..28),
    "fifth" => Array(29..31),
    "teenth" => Array(13..19),
    "last" => Array(-7..-1).reverse
  }

  attr_reader :month, :year

  def initialize(year, month)
    @year = year
    @month = month
  end

  def day(weekday, schedule)
    day_of_week = DAYS[weekday.downcase.to_sym]
    potential_days = SCHEDULE[schedule.downcase]

    potential_days.each do |day|
      begin
        date = Date.civil(year, month, day)
      rescue Date::Error
        next
      end
      return date if date.wday == day_of_week
    end
    nil
  end
end