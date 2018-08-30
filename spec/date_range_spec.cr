require "spec2"
require "../src/date_range"
require "./spec_helper"

Spec2.describe App::DateRange do
  alias Date = Cronus::Date

  describe "#initialize(from, to)" do
    it "can be initialized with :from and :to" do
      # Given
      from = Date.new(2018, 1, 1)
      to = Date.new(2018, 1, 5)
      # When
      date = App::DateRange.new(from, to)
      # Then
      expect(date.from.year).to eq(2018)
      expect(date.from.month.to_s).to eq("January")
      expect(date.from.day).to eq(1)

      expect(date.to.year).to eq(2018)
      expect(date.to.month.to_s).to eq("January")
      expect(date.to.day).to eq(5)
    end
  end

  describe "#has_other_dates" do
    it "checks if there is another date" do
      # Given
      from = Date.new(2018, 1, 1)
      to = Date.new(2018, 1, 5)
      other_date = Date.new(2018, 2, 27)
      yet_another_date = Date.new(2018, 3, 7)
      # When
      date = App::DateRange.new(from,
        to,
        other_date,
        yet_another_date
      )
      # Then
      p other_dates: date.has_other_dates
      expect(date.has_other_dates).to be_true
    end
  end

  describe "#overlapping?" do
    it "checks if there dateranges are overlapping" do
      # Given
      from = Date.new(2018, 1, 1)
      to = Date.new(2018, 1, 5)

      other_from = Date.new(2018, 1, 1)
      other_to = Date.new(2018, 1, 5)

      # When
      date_range = App::DateRange.new(from, to)
      other_date_range = App::DateRange.new(other_from, to, other_to)

      overlapping_date_range = (date_range == other_date_range)
      # Then
      # expect(overlapping_date_range).to be_true
    end
  end
end
