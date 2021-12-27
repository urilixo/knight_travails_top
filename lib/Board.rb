class Board
  require 'colorize'
  require_relative 'Knight'
  require 'pry-byebug'
  attr_reader :board

  def initialize(rows: 8, columns: 8)
    new_board(rows, columns)
  end

  def new_board(rows, columns)
    @board = Array.new(rows) { Array.new(columns) }
    @board.each_with_index do |row, i|
      row.each_with_index do |_cell, j|
        @board[i][j] = (i + j).even? ? '   '.on_white : '   '.on_black
      end
    end
  end

  def place_piece(piece)
    x, y = piece.position
    @board[x][y] = piece
  end

  def background_color(piece)
    x, y = piece.position
    (x + y).even? ? piece.value.black.on_white : piece.value.white.on_black
  end

  def print_board
    printed = []
    @board.each do |row|
      temp_row = []
      row.each do |cell|
        cell = cell.instance_of?(Knight) ? background_color(cell) : cell
        temp_row << cell
      end
      printed << temp_row
    end
    printed.each { |row| puts row.join }
  end
end

test = Board.new
test.place_piece(Knight.new([4, 5]))
test.print_board
p test.board
#binding.pry
puts 'ok'

