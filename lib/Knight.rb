class Knight
  require_relative 'Node'
  attr_reader :position, :value

  def initialize(position)
    @value = ' ♞ '
    @position = position
    @moves = [Node.new(position)]
    @visited = []
  end

  def knight_moves(end_position)
    path = []
    return if end_position == @position

    valid_moves(next_in_queue)
    path << find_path(end_position)
    self
  end

  def next_in_queue
    return if @moves.empty?

    current_node = @moves.pop
    return next_in_queue if @visited.include?(current_node.value)

    current_node
  end

  def find_path(end_position)
    @moves.each do |node|
      next unless node.value == end_position

      @position = node.value
      return path_to_root(node)
    end
    valid_moves(next_in_queue)
    find_path(end_position)
  end

  def path_to_root(node)
    path = []
    path.unshift(node.value)
    until node.parent.nil?
      path.unshift(node.parent.value)
      node = node.parent
    end
    p path
  end

  def valid_moves(node)
    array = node.value
    @visited << array
    row = array[0]
    col = array[1]
    moves = [[-2, -1], [-1, -2], [-2, 1], [1, -2], [-1, 2], [2, -1], [1, 2], [2, 1]]
    moves.each do |move|
      x = move[0] + row
      y = move[1] + col
      @moves.unshift(Node.new([x, y], parent: node)) if x.between?(0, 7) && y.between?(0, 7)
    end
  end
end
