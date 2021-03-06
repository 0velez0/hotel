require 'date'
require_relative 'reservation'
require_relative 'room'
require_relative 'unavailable_error'

module Hotel
  class Admin

    attr_reader :rooms, :reservations

    def initialize
      @rooms = []
      (1..20).each do |num|
        @rooms << Room.new(num)
      end
      @reservations = []
    end

    def reserve_room(check_in, check_out)
      res_data = {reservation_id: next_res_id, check_in: check_in, check_out: check_out, room: assign_room(check_in,check_out)}
      new_res = Reservation.new(res_data)
      @reservations << new_res
      return new_res
    end

    private

    def reservations_for_a_given_date(date)
      validated_date = DateHelper.validate_date(date)
      reservation_for_date = @reservations.find_all {|res| (res.check_in...res.check_out).include?(validated_date)}
      return reservation_for_date
    end

    def reservations_for_date_range(check_in, check_out)
      validated_check_in = DateHelper.validate_date(check_in)
      validated_check_out = DateHelper.validate_date(check_out)
      reservations_for_range = []
      (validated_check_in...validated_check_out).each do |one_date|
        reservations_for_range += reservations_for_a_given_date(one_date)
      end
      return reservations_for_range
    end

    def unavailable_rooms(check_in, check_out)
      reservations_for_range = reservations_for_date_range(check_in, check_out)
      unavailable_rooms = reservations_for_range.map {|one_res| one_res.room}
      unavailable_rooms = unavailable_rooms.uniq
      return unavailable_rooms
    end

    def available_rooms(check_in, check_out)
      reserved_rooms = unavailable_rooms(check_in, check_out)
      not_reserved_rooms = @rooms.reject {|room| reserved_rooms.include?(room)}
      return not_reserved_rooms
    end

    def next_res_id
      @reservations.length + 1
    end

    def assign_room(check_in, check_out)
      if available_rooms(check_in, check_out).length == 0
        raise UnavailableError.new("Sorry! There are no rooms available!")
      else
        # Assigns first room available in the list of room numbers
        assign_available_room = available_rooms(check_in, check_out).first
      end
      return assign_available_room
    end

  end # ends admin
end # ends module Hotel
