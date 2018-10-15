# didn't care for the best solution, thought mine was better lol
# trying to shorten lines by using lambda
def compute_depth_two_electric_boogaloo n
 result, multiplier = [], 0
 -> { multiplier += 1 ; result.concat((n*multiplier).to_s.split('')).uniq! }.call until result.length == 10
 multiplier
end

# initial solution
def compute_depth n
 result, multiplier =[], 0

  while result.length < 10
    multiplier += 1
    # key to this is uniq! which changes array in place
    result.concat((n*multiplier).to_s.split('')).uniq!
  end

  multiplier
end
