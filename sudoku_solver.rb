# Write a function that will solve a 9x9 Sudoku puzzle. The function will take one argument consisting of the 2D puzzle
# array, with the value 0 representing an unknown square.
#
# The Sudokus tested against your function will be "easy" (i.e. determinable; there will be no need to assume and test
# possibilities on unknowns) and can be solved with a brute-force approach.
def sudoku(puzzle)
end

def complete_row
  (1..9).to_a
end

# return the values not in a row
# puzzle = 2d array of puzzle
# row = integer value 0-8
def digits_not_in_row(puzzle, row)
  complete_row - puzzle[row]
end

# return the values not in a column
# puzzle = 2d array of puzzle
# column = integer value 0-8
def digits_not_in_column(puzzle, column)
  complete_row - puzzle.map{ |row| row[column] }
end
