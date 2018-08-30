require "cronus"

module App
  struct DateRange
    alias Date = Cronus::Date
    alias Range = Cronus::DateRange

    include Comparable(Date)

    getter from, to
    property other = [] of Date

    def initialize(@from : Date, @to : Date, *other_date)
      raise Exception.new(":from should be less than :to") unless (to >= from)
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

    def overlaps_with(other : DateRange) : Bool
      if other.from >= from && other.from <= to
        return true
      end
      if other.to >= from && other.to <= to
        return true
      end
      if other.to <= to && other.to >= from
        return true
      end
      false
    end

    def range
      DateRange.new(from, to)
    end
  end
end
