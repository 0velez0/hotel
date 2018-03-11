require_relative 'spec_helper'

# TDD pattern:
#
# ARRANGE: variables and inputs
# ACT: Call method we are testing. Perform an action which we want to test
# ASSERT: Check with an expectation if it gives the desired result

describe "Admin class" do
  describe "initialize" do
    it "creates a new instance of Admin" do
      Hotel::Admin.new.must_be_instance_of Hotel::Admin
    end

    it "creates instance of rooms" do
      rooms_in_hotel = Hotel::Admin.new.rooms
      rooms_in_hotel.must_be_instance_of Array
      rooms_in_hotel.each do |room|
          room.must_be_instance_of Hotel::Room
      end
    end # ends "creates instance of rooms"

    it "creates 20 rooms" do
      rooms_in_hotel = Hotel::Admin.new.rooms
      rooms_in_hotel.count.must_equal 20
    end

    it "creates an empty array of reservations" do
      reservations_in_hotel = Hotel::Admin.new.reservations
      reservations_in_hotel.must_be_kind_of Array
      reservations_in_hotel.count.must_equal 0
    end

end # ends describe initialize

  describe "reserve room method" do
    it "returns a new reservation" do
      # ARRANGE: variables and inputs
      check_in_date = '2018-01-01'
      check_out_date = '2018-01-06'
      instance_of_admin = Hotel::Admin.new

      # ACT: Call method we are testing. Perform an action which we want to test
      new_res =  instance_of_admin.reserve_room(check_in_date, check_out_date)

      # ASSERT: Check with an expectation if it gives the desired result
      new_res.must_be_instance_of Hotel::Reservation
    end # ends returns a new reservation

    it "adds a new reservation to reservations array" do
      # ARRANGE: variables and inputs
      check_in_date = '2018-01-01'
      check_out_date = '2018-01-06'
      instance_of_admin = Hotel::Admin.new
      num_reservations = instance_of_admin.reservations.count

      # ACT: Call method we are testing. Perform an action which we want to test
      instance_of_admin.reserve_room(check_in_date, check_out_date)

      # ASSERT: Check with an expectation if it gives the desired result
      instance_of_admin.reservations.count.must_equal num_reservations + 1
      instance_of_admin.reservations.last.must_be_instance_of Hotel::Reservation
    end

    it "assigns a new reservation id" do
    # get return value and checks its id and checks if it's different than other ids
    end

    it "uses checkin and checkout date for reservation" do
    # the dates on the reservation instance are the same ones that we passed into the method
    end

    it "assigns a room" do
    # checks that the res instance has a room
    end

    it "giving invalid checkin and checkout dates" do
      # example: strings that can't be converted into dates
      # another example: checkin that is after checkout date
    end

    it "raises an error when there are no rooms available" do
      # C sez this will be hard!!!
      # this can happen when call to assign room
      # set up a scenario when you don't have rooms available: 20 times do???
      # lots of setup here
    end
  end # ends "reserve room"

end # ends Admin class

# # Suggestion for another test
# describe reserve room
# IT RAISES AN ERROR if room is already reserved
# room = Hotel::Room.new(1)
# # here call 'reserve_room' twice
# checkin = Date.new('2018-03-01')
# checkout =
# reservation = Hotel::Admin.new.reserve_room(with param that this method tests )
# proc {Hotel::Admin.new.reserve_room(with param that this method tests)}.must_raise ArgumentError


# TODO write tests like these for 'reservations_for_a_given_date'

# describe
# do a 'before do' to not have to re-state ARRANGE data over and over again
# "it returns true if check_in date is before check_out date"
# "it returns false if date to book is before check_in"
# "it returns false if date to book is after check_out"
