require "spec2"
require "../src/date_range"
require "./spec_helper"

Spec2.describe App::DateRange do
  alias Date = Cronus::Date

  describe "#initialize(from, to)" do
    context "initialized from and to" do
      context ":from (start date) is less than :to (end date)" do
        it "creates instance" do
          # Given
          from = Date.new(2018, 1, 1)
          to = Date.new(2018, 1, 5)
          # When
          date_range = App::DateRange.new(from, to)
          # Then
          expect(date_range.from).to eq(from)
          expect(date_range.to).to eq(to)
        end
      end

      context ":from (start date) is greater than :to (end date)" do
        it "will fail" do
          # Given
          from = Date.new(2018, 1, 5)
          to = Date.new(2018, 1, 1)
          expect { App::DateRange.new(from, to) }.to raise_error(Exception, ":from should be less than :to")
        end
      end
    end
  end

  describe "#includes?" do
    context "checks if there are any other date" do
      it "determines" do
        # Given
        from = Date.new(2018, 1, 1)
        to = Date.new(2018, 1, 5)
        other_date = Date.new(2018, 2, 27)
        yet_another_date = Date.new(2018, 3, 7)
        # When
        date_range = App::DateRange.new(from,
          to,
          other_date,
          yet_another_date
        )
        # # Then
        # p range: date_range.from
        expect(date_range.includes?(other_date)).to be_true
        expect(date_range.includes?(yet_another_date)).to be_true
      end
    end
    context "checks if there aren't any other date" do

    end

  end

  describe "#overlaps_with" do
    context "has overlapping date ranges" do
      it "determines overlapping" do
        # Given
        from = Date.new(2018, 1, 1)
        to = Date.new(2018, 1, 5)

        other_from = Date.new(2018, 1, 2) # less than from and greater than
        other_to = Date.new(2018, 1, 6)

        # When
        date_range = App::DateRange.new(from, to)
        other_date_range = App::DateRange.new(other_from, to, other_to)

        expect(date_range.overlaps_with(other_date_range)).to be_true
      end

      it "should detect same :from and :end date" do
        from = Date.new(2018, 1, 1)
        to = Date.new(2018, 1, 5)

        other_from = Date.new(2018, 1, 1) # less than from and greater than
        other_to = Date.new(2018, 1, 5)

        # When
        date_range = App::DateRange.new(from, to)
        other_date_range = App::DateRange.new(other_from, to, other_to)

        expect(date_range.overlaps_with(other_date_range)).to be_true
      end

      it "should detect same :from and :other#to date" do
        from = Date.new(2018, 1, 5)
        to = Date.new(2018, 1, 5)

        other_from = Date.new(2018, 1, 1) # less than from and greater than
        other_to = Date.new(2018, 1, 5)

        # When
        date_range = App::DateRange.new(from, to)
        other_date_range = App::DateRange.new(other_from, to, other_to)

        expect(date_range.overlaps_with(other_date_range)).to be_true
      end
    end
    context "has no overlapping date ranges" do
      it "doesn't detect overlapping date ranges" do
        from = Date.new(2018, 1, 1)
        to = Date.new(2018, 1, 5)

        other_from = Date.new(2017, 1, 1) # less than from and greater than to
        other_to = Date.new(2017, 12, 31)

        # When
        date_range = App::DateRange.new(from, to)
        other_date_range = App::DateRange.new(other_from, other_to)

        expect(date_range.overlaps_with(other_date_range)).to be_false
      end
    end
  end
end
