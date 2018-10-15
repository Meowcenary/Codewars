def print_hex_grid(hex_grid)
  offset = false

  hex_grid.each do |row|
    if offset
      print '   '
      offset = false
    else
      offset = true
    end

    row.each do |hex|
      print "|#{hex}|"
    end

    print "\n\n"
  end
end

def create_hex_grid(height, length)
  (0..height).map { |h| (0..length).map { |l| "#{l}, #{h}" } }
end

def adjacent_hexes(row, column, hex_grid)
  adjacent_hexes = []
  # top right
  adjacent_hexes << hex_grid[row - 1][column + 1]
  # top left
  adjacent_hexes << hex_grid[row - 1][column]
  # right
  adjacent_hexes << hex_grid[row][column + 1]
  # left
  adjacent_hexes << hex_grid[row][column - 1]
  # bottom right
  adjacent_hexes << hex_grid[row + 1][column + 1]
  # bottom left
  adjacent_hexes << hex_grid[row + 1][column]
end
