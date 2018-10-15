class HexGrid
  def initialize(height, length)
    @hexes = (0..height).map { |row| (0..length).map { |column| Hex.new(column, row)} }
  end

  def find_by_coordinate(row, column)
    @hexes[row][column]
  end

  def print
    grid = ''
    offset = false

    @hexes.each do |row|
      if offset
        grid += '   '
        offset = false
      else
        offset = true
      end

      row.each do |hex|
        grid += hex.coordindate
      end

      # grid_connectors = '   \\  /'*@hexes.first.length
      ##{grid_connectors}
      grid +=  "\n\n"
    end

    puts grid
  end

  def adjacent(hex)
    adjacent_hexes = []

    # top right
    adjacent_hexes << @hexes[hex.row - 1][hex.column + 1]
    # top left
    adjacent_hexes << @hexes[hex.row - 1][hex.column]
    # right
    adjacent_hexes << @hexes[hex.row][hex.column + 1]
    # left
    adjacent_hexes << @hexes[hex.row][hex.column - 1]
    # bottom right
    adjacent_hexes << @hexes[hex.row + 1][hex.column + 1]
    # bottom left
    adjacent_hexes << @hexes[hex.row + 1][hex.column]
  end
end

