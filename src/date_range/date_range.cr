require "cronus"

struct App::DateRange
  alias Date = Cronus::Date

  include Comparable(Date)

  getter from, to

  # property other = Tuple.new
  def initialize(@from : Date, @to : Date, *other_date)
    # @other = Tuple.new
    # @other = other_date
    has_other_dates(other_date)
  end

  private def has_other_dates(other : Tuple) : Bool
    other.size > 0
  end

  def has_other_dates : Bool
    true
  end

  def overlapping?(other_date : DateRange)
    date = self.from <=> self.to
  end
end
