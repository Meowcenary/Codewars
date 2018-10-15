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
  (0..height).map { |h| (0..length).map { |l| "#{h}, #{l}" } }
end

