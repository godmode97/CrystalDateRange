require "spec2"
require "../src/date_range"
require "./spec_helper"

Spec2.describe "DateRange Class" do
  it "accepts from and to date" do
    # Given
    from = Time.new(2018, 1, 1)
    to = Time.new(2018, 1, 5)
    # When
    date = App::DateRange.new(from, to)
    #Then
    expect(date.from.year).to eq(2018)
    expect(date.from.month).to eq(1)
    expect(date.from.day).to eq(1)

    expect(date.to.year).to eq(2018)
    expect(date.to.month).to eq(1)
    expect(date.to.day).to eq(5)
  end

  it "checks if there is another date" do
    # Given
    from = Time.new(2018, 1, 1)
    to = Time.new(2018, 1, 5)
    other_date = Time.new(2018, 2, 27)
    # When
    date = App::DateRange.new(from, to, other_date)
    # Then
    expect(date.has_another_date).to be_true
  end

  it "checks if there dateranges are overlapping" do
    # Given
    from = Time.new(2018, 1, 1)
    to = Time.new(2018, 1, 5)

    other_from = Time.new(2018, 1, 1)
    other_to = Time.new(2018, 1, 5)

    # When
    date_range = App::DateRange.new(from, to, other_date)
    other_date_range = App::DateRange.new(other_from, to, other_to)

    overlapping_date_range = (date_range == other_date_range)
    # Then
    expect(overlapping_date_range).to be_true
  end

end