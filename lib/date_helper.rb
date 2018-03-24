require 'date'


module Hotel
  class DateHelper

    def self.validate_date(date) # <- method on DateHelper class itself instead of an instance of DateHelper; call it as 'DateHelper.validate_date'
      if date.class == String
        date = Date.parse(date)
      elsif date.class != Date
        raise ArgumentError.new("Received: #{date}. That entry is not valid.  Please enter date in the form of '2001-02-03' or...")
      end
      return date
    end

    def self.validate_stay(check_in, check_out)
      check_in_date = validate_date(check_in)
      check_out_date = validate_date(check_out)
      if check_in_date > check_out_date
        raise ArgumentError.new("The check-out date: #{check_out} is before the check-in date: #{check_in}.")
      end
    end

  end # ends class
end # ends module
