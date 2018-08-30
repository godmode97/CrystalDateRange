require "cronus"

struct App::DateRange
  alias Date = Cronus::Date

  include Comparable(Date)

  getter from, to
  property other = Hash(String, Date).new

  def initialize(@from : Date, @to : Date, *other_date)
    has_other_dates(other_date)
  end

  private def has_other_dates(other_date : Tuple)
    other_date.each do |value|
      other["date"] = value
    end
  end

  def has_other_dates : Bool
    other.size > 0
  end

  def overlapping?(other_date : DateRange)
    date = self.from <=> self.to
  end
end
