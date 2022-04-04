require_relative 'chessBoard'

class Main
  def initialize
    @chessBoard = ChessBoard.new
    puts "Chess Board game made by Darshan"
    puts "Type Rules to check out the rules"
    print_menu
    while (input = gets.chomp.split) != ['QUIT']
      case input[0]
      when 'REPORT'
        @chessBoard.report
      when 'PLACE'
        x, y, face, color = input[1].split(',')
        @chessBoard.place(x.to_i, y.to_i, face, color)
      when 'LEFT', 'RIGHT'
        @chessBoard.change_direction(input[0])
      when 'MOVE'
        @chessBoard.move(input[1].to_i)
      else
        p "Please choose the correct option"
      end
      print_menu
    end

  end

  def print_menu
    puts "------------------------"
    puts "\n"
    puts "- PLACE X,Y,F,C"
    puts "- MOVE X"
    puts "- LEFT"
    puts "- RIGHT"
    puts "- REPORT"
    puts "- QUIT"
    puts "\n"
  end
end

main = Main.new
