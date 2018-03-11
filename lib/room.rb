require 'date'

module Hotel
  class Room

    attr_accessor :price

    attr_reader :room_num

    def initialize(room_num)
      # @status = :AVAILABLE
      @room_num = room_num
      @price = 200.00
    end # ends initialize


  end # ends Room
end # ends module Hotel
