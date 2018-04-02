require 'date'

module Hotel
  class Reservation
    attr_reader  :reservation_id, :check_in, :check_out, :room
    # attr_accessor :

    def initialize(res_data)
      @reservation_id = res_data[:reservation_id]
      @room = res_data[:room] # <-- an instance of room

      @check_in = Date.parse(res_data[:check_in]) if res_data[:check_in]
      @check_out = Date.parse(res_data[:check_out]) if res_data[:check_out]

      DateHelper.validate_stay(@check_in, @check_out)
    end # ends initialize

    def duration
    date_range = (check_out - check_in).to_i
    return date_range
    end

    def total_cost
      @room.price * duration
    end

  end # ends Reservation
end # ends module Hotel
