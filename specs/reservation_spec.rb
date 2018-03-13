require_relative 'spec_helper'

describe "Reservation class" do
  describe "initialize" do
    it "creates a new instance of Reservation" do
      res_data = {:reservation_id => 1, :check_in => '2018-01-01', :check_out => '2018-01-03', :room => Hotel::Room.new(3)}
      Hotel::Reservation.new(res_data).must_be_instance_of Hotel::Reservation
    end

    it "checks invalid dates" do
      res_data = {
        :reservation_id => 1,
        :check_in => '2018-01-03',
        :check_out => '2018-01-01',
        :room => Hotel::Room.new(3)}

      proc {
        Hotel::Reservation.new(res_data).validate_stay(res_date[:check_in], res_data[:check_out])}.must_raise ArgumentError
    end

  end # ends describe "initialize"

  describe "duration method" do
    it "returns the number of nights for this reservation" do
      res_data = {:reservation_id => 1, :check_in => '2018-01-01', :check_out => '2018-01-03', :room => Hotel::Room.new(3)}
      new_res = Hotel::Reservation.new(res_data)
      new_res.duration.must_equal 2
    end

    it "returns zero for an invalid reservation date range" do
      res_data = {:reservation_id => 1, :check_in => '2018-01-01', :check_out => '2018-01-01', :room => Hotel::Room.new(3)}
      new_res = Hotel::Reservation.new(res_data)
      new_res.duration.must_equal 0
    end
  end # ends describe "duration method" do

  describe "total_cost method" do
    it "returns total cost for a given reservation" do
      res_data = {:reservation_id => 1, :check_in => '2018-01-01', :check_out => '2018-01-03', :room => Hotel::Room.new(3)}
      new_res = Hotel::Reservation.new(res_data)
      new_res.total_cost.must_equal 400.00
    end

    it "returns zero for an invalid reservation" do
        res_data = {:reservation_id => 1, :check_in => '2018-01-01', :check_out => '2018-01-01', :room => Hotel::Room.new(3)}
        new_res = Hotel::Reservation.new(res_data)
        new_res.total_cost.must_equal 0
    end
  end # ends describe "total_cost method"

end # ends describe "Reservation class"
