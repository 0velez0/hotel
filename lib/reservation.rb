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

      validate_stay(@check_in, @check_out)

    end # ends initialize

    def duration
    date_range = (check_out - check_in).to_i
    return date_range
    end

    def total_cost
      @room.price * duration
    end

    private

    def validate_date(date)
      # if it's already a date, we don't wanna do anything to it
      if date.class == String
        date = Date.parse(date)
      elsif date.class != Date
        raise ArgumentError.new("Received: #{date}. That entry is not valid.  Please enter date in the form of '2001-02-03' or...")
      end
      return date
    end

    def validate_stay(check_in, check_out)
      check_in_date = validate_date(check_in)
      check_out_date = validate_date(check_out)
      if check_in_date > check_out_date
        raise ArgumentError.new("The check-out date: #{check_out} is before the check-in date: #{check_in}.")
      end
    end

  end # ends Reservation
end # ends module Hotel
