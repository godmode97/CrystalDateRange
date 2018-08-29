struct App::DateRange
  getter from, to, other
  def initialize(@from : Time, @to : Time, *other_date)
    # @other = Tuple.new
    @other = other_date
    p other_date_as_array: other_date.as_a
  end

  def has_another_date
    @other.as_a.size > 0
  end

  def overlaps(new_date : DateRange)

  end
end