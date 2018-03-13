require_relative 'spec_helper'


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
    end
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
      check_in_date = '2018-01-01'
      check_out_date = '2018-01-06'
      instance_of_admin = Hotel::Admin.new

      new_res =  instance_of_admin.reserve_room(check_in_date, check_out_date)

      new_res.must_be_instance_of Hotel::Reservation
    end

    it "adds a new reservation to reservations array" do
      check_in_date = '2018-01-01'
      check_out_date = '2018-01-06'
      instance_of_admin = Hotel::Admin.new
      num_reservations = instance_of_admin.reservations.count

      instance_of_admin.reserve_room(check_in_date, check_out_date)

      instance_of_admin.reservations.count.must_equal num_reservations + 1
      instance_of_admin.reservations.last.must_be_instance_of Hotel::Reservation
    end

    it "doesn't add a reservation when there are no available rooms for a given date" do

      instance_of_admin = Hotel::Admin.new
      20.times do
        instance_of_admin.reserve_room('2018-01-01', '2018-01-06')
      end

      proc {instance_of_admin.reserve_room('2018-01-01', '2018-01-06')}.must_raise ArgumentError
    end

    it "assigns a new reservation id" do
      # get return value and checks its id and checks if it's different than other ids
    end

    it "uses checkin and checkout date for reservation" do
      # the dates on the reservation instance are the same ones that we passed into the method
    end

    it "assigns a room" do
      # checks that the reservation instance has a room
    end

    it "giving invalid checkin and checkout dates" do
      # example: strings that can't be converted into dates
      # another example: checkin that is after checkout date
    end

    it "raises an error when there are no rooms available" do
      # This one might be hard
      # lots of setup here
      # this can happen when call to assign room
      # set up a scenario when you don't have rooms available: 20 times do???
    end
  end # ends describe "reserve room method"

end # ends describe "Admin class"
