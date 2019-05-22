# best practice version, clever and makes sense
OPPOSITE = {
  "NORTH" => "SOUTH",
  "SOUTH" => "NORTH",
  "EAST"  => "WEST",
  "WEST"  => "EAST"
}

def dirReducBestPractice(arr)
  stack = []
  arr.each do |dir|
    OPPOSITE[dir] == stack.last ? stack.pop : stack.push(dir)
  end
  stack
end

# this works, but it's ripe for refactoring to be more readable and definitely
# isn't the best solution :(
def dirReduc(arr)
  removal = false

  reduced = arr.each_cons(2).map do |dir, next_dir|
    if ((dir == 'NORTH' && next_dir == 'SOUTH') || (dir == 'SOUTH' && next_dir == 'NORTH')) ||\
        ((dir == 'EAST' && next_dir == 'WEST') || (dir == 'WEST' && next_dir == 'EAST'))
      removal = true
      dir.clear
      next_dir.clear
    else
      dir
    end
  end

  if !reduce.last.nil?
    reduced << arr.last
  end

  reduced.reject!{ |dir| dir.empty? }

  if removal
    dirReduc(reduced)
  else
    reduced
  end
end
