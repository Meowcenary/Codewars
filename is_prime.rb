require 'prime'

def is_prime_with_library?(num)
  num.prime?
end

# implementing yourself
def is_prime?(num)
  return false if num < 2
  (2..num).to_a.select { |n| num % n == 0 }.compact.empty?
end
