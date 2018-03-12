require_relative 'spec_helper'


describe "Room class" do
  describe "initialize" do
    it "creates a new instance of Room" do
    new_room_instance = Hotel::Room.new(1)
    new_room_instance.must_be_instance_of Hotel::Room
    end

  end # ends describe "initialize"

end # ends describe "Room class"
