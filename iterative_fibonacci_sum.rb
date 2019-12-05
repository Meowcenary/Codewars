def perimeter(n)
  4*fib(n+1, {}).values.sum
end

# iteratation avoids recursion which stops the stack from blowing up
def fib(end_key, sequence)
  (0..end_key).each do |i|
    i < 2 ? sequence[i] = i : (sequence[i] = sequence[i-1] + sequence[i-2])
  end

  sequence
end
