require_relative 'spec_helper'

describe "DateHelper class" do
  describe "validate_stay method" do

    it "raises an error for invalid dates" do
      res_data = {
        :reservation_id => 1,
        :check_in => '2018-01-03',
        :check_out => '2018-01-01',
        # :room => Hotel::Room.new(3) Not using this any more
      }

      proc {
        Hotel::DateHelper.validate_stay(res_data[:check_in], res_data[:check_out])
      }.must_raise ArgumentError
    end

    it "raises an ArgumentError for nil check_in" do
      res_data = {
        :reservation_id => 1,
        :check_in => nil,
        :check_out => '2018-01-01',
        # :room => Hotel::Room.new(3)
      }

      proc {
        Hotel::DateHelper.validate_stay(res_data[:check_in], res_data[:check_out])
      }.must_raise ArgumentError
    end

    it "raises an ArgumentError for nil check_out" do
      res_data = {
        :reservation_id => 1,
        :check_in => '2018-01-01',
        :check_out => nil,
        # :room => Hotel::Room.new(3)
      }
      proc {
        Hotel::DateHelper.validate_stay(res_data[:check_in], res_data[:check_out])
      }.must_raise ArgumentError
    end

    describe "validate_date method" do
      it "raises an ArgumentError for an nil date" do
        date = nil
        proc {
          Hotel::DateHelper.validate_date(date)
        }.must_raise ArgumentError
      end
      it "converts a valid date string to date object" do
        test_date = '2018-03-22'
        returned_date = Hotel::DateHelper.validate_date(test_date)
        returned_date.must_be_kind_of Date
        returned_date.year.must_equal 2018
        returned_date.month.must_equal 3
        returned_date.day.must_equal 22
      end
      it "raises an ArgumentError for an invalid date string" do
        date = 'jsljlfsdlfdlkfdsl'
        proc {
          Hotel::DateHelper.validate_date(date)
        }.must_raise ArgumentError
      end
      it "returns the same date when given a date object" do
        test_date = Date.parse('2018-03-22')
        Hotel::DateHelper.validate_date(test_date).must_equal test_date
      end
    end
  end
end # ends describe
