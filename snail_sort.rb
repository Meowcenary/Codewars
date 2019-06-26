def snail array
  print array
  result = []
  return result if (array.empty? || array.first.empty?)

  # boundaries
  left_column = 0
  right_column= (array.length - 1)
  top_row = 0
  bottom_row = right_column

  while top_row <= (array.length/2) do
    # left to right across top row
    (left_column..right_column).each do |column|
      result << array[top_row][column]
    end

    # top to bottom on rightmost column
    (top_row+1..bottom_row).each do |row|
      result << array[row][right_column]
    end

    right_to_left = (right_column-1..left_column)
    # adjust right one, then iterate bottom right to left
    (right_to_left.first).downto(right_to_left.last).each do |column|
      # subtracting column index from right column reverses the traversal
      result << array[bottom_row][column]
    end

    bottom_to_top = (bottom_row-1..top_row+1)
    # then iterate bottom to top
    (bottom_to_top.first).downto(bottom_to_top.last).each do |row|
      result << array[row][left_column]
    end

    # increment top row (lower it) and left column (move right)
    top_row += 1
    left_column += 1

    # decrement bottom row (move it up) and right column (move left)
    bottom_row -= 1
    right_column -= 1
  end
  result
end