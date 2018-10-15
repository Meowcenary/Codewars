class Hex
  attr_accessor :content
  attr_reader :column, :row

  def initialize(column, row)
    @column = column
    @row = row
    @content = nil
  end

  def coordindate
    "|#{@column}, #{@row}|"
  end
end

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
