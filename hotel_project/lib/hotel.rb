require_relative "room"

class Hotel
  def initialize(name, rooms)
    @name = name
    @rooms = Hash[rooms.collect { |key, value| [key, Room.new(value)] } ]
  end

  attr_reader :rooms

  def name
    @name.split.map(&:capitalize).join(' ')
  end

  def room_exists?(room)
    if @rooms[room]
      true
    else
      false
    end
  end

  def check_in(person, room)
    if room_exists?(room)
      p @rooms[room].add_occupant(person) ? 'check in successful' : 'sorry, room is full'
    else
      p 'sorry, room does not exist'
    end
  end

  def has_vacancy?
    if @rooms.keys.all?{ |room| @rooms[room].full? }
      false
    else
      true
    end
  end

  def list_rooms
    @rooms.keys.each { |room| puts room + ' : ' + @rooms[room].available_space.to_s }
  end
end
