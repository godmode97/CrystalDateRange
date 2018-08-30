require "cronus"

module App
  struct DateRange
    alias Date = Cronus::Date
    alias Range = Cronus::DateRange

    include Comparable(Date)

    getter from, to
    property other = [] of Date

    def initialize(@from : Date, @to : Date, *other_date)
      raise Exception.new(":from should be less than :to") unless to > from
      has_other_dates(other_date)
    end

    private def has_other_dates(other_date : Tuple)
      other_date.each do |value|
        other << value
      end
    end

    def includes?(other_date : Date)
      other.includes?(other_date)
    end

    def overlaps_with(other : DateRange)
    end
  end
end
