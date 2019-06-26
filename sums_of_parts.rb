# my solution
def parts_sums(ls)
  return [0] unless !ls.empty?

  result = [ls.reduce(:+)]
  while !ls.empty? do
    result << (result.last - (ls.shift))
  end

  result
end