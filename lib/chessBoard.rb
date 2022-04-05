require_relative 'pawn'

class ChessBoard
  def initialize
    @count = 0
    @current_pawn_id = nil
  end

  def report
    if @current_pawn_id.nil?
      puts "You need to place atleast one pawn on the board"
      return nil
    end

    @pawn = Pawn.get_instance_by_id(@current_pawn_id)[0]
    position = @pawn.position
    puts "x: #{position[0]}\ny: #{position[1]}\nFace: #{position[2]}\nColor: #{position[3]}"
  end

  def move(units)
    if @current_pawn_id.nil?
      puts "You need to place atleast one pawn on the board"
      return nil
    end
    @pawn = Pawn.get_instance_by_id(@current_pawn_id)[0]
    @pawn.move(units)
  end

  def place(x, y, face, color)
    if is_inside_board?(x, y)
      pawn = Pawn.new(@count, x, y, face, color, self)
      @current_pawn_id = pawn.id
      @count += 1
    else
      puts "Pick the correct co-ordinates"
    end
  end

  def change_direction(direction)
    if @current_pawn_id.nil?
      puts "You need to place atleast one pawn on the board"
      return nil
    end

    @pawn = Pawn.get_instance_by_id(@current_pawn_id)[0]
    @pawn.change_face(direction)
  end

  def is_inside_board?(x, y)
    if x.negative? || y.negative? || x > 7 || y > 7
      return false
    end
    return true
  end
end