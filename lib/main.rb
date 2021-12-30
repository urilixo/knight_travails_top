require_relative 'Board'

test = Board.new
test.place_piece(Knight.new([1, 1]))
test.print_board
test.move_piece(test.board[1][1].position, test.board[1][1].knight_moves([7, 6]))
test.print_board
