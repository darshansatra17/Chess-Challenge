class Pawn
  @@instance_collector = []
  attr_reader :id

  def initialize(id, x, y, face, color, board)
    @id = id
    @move_count = 0
    @x = x
    @y = y
    @face = face
    @board = board
    @color = color
    @@instance_collector.append(self)
  end

  def self.get_instance_by_id(id)
    @@instance_collector.select { |pawn| pawn.id == id }
  end

  def position
    [@x, @y, @face, @color]
  end

  def change_face(direction)
    if direction == 'RIGHT'
      case @face
      when 'EAST'
        @face = 'SOUTH'
      when 'WEST'
        @face = 'NORTH'
      when 'NORTH'
        @face = 'EAST'
      when 'SOUTH'
        @face = 'WEST'
      end
    end

    if direction == 'LEFT'
      case @face
      when 'EAST'
        @face = 'NORTH'
      when 'WEST'
        @face = 'SOUTH'
      when 'NORTH'
        @face = 'WEST'
      when 'SOUTH'
        @face = 'EAST'
      end
    end
  end

  def move(units)
    if validate_if_first_move?(units)
      val_x, val_y = coordinates_after_move(units)
      if @board.is_inside_board?(val_x,val_y)
        @x = val_x
        @y = val_y
        @move_count+=1
      else
        puts "MOVE NOT ALLOWED"
      end
    else
      puts "Please enter the correct units"
    end
  end

  def validate_if_first_move?(units)
    if units == 2
      return @move_count == 0
    end
    return true
  end

  def coordinates_after_move(units)
    return [@x, @y + units] if @face == 'NORTH'
    return [@x, @y - units] if @face == 'SOUTH'
    return [@x + units, @y] if @face == 'EAST'
    return [@x - units, @y] if @face == 'WEST'
    [-1, -1]
  end

end
