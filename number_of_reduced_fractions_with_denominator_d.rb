# brute force algorithm - works for small numbers, but times out on large numbers
def brute_force_proper_fractions(n)
  return 0 if n == 1
  proper_fractions_found = 0

  # for each number from 1 to n
  (1..n-1).each do |i|
    puts i

    # if the numerator is 1 it can't be reduced
    if i == 1
      proper_fractions_found += 1
    # if the numerator is > 1 it needs to be checked
    elsif reducable?(i, n)
      next
    else
      proper_fractions_found += 1
    end
  end

  proper_fractions_found
end

def reducable?(numerator, denominator)
  # from 2 to the currenter numerator
  (2..numerator).each do |j|
    # check if the numerator and denominator are evenly divisble by the same number
    if (numerator%j == 0 && denominator%j == 0)
      return true
    end
  end

  false
end

# First optimization - use Euclid's algorithm
# https://en.wikipedia.org/wiki/Greatest_common_divisor#Euclid's_algorithm
#
def recursive_gcd_proper_fractions(n)
  return 0 if n == 1
  proper_fractions_found = 0

  (1..n-1).each do |i|
    if recursive_gcd(i, n) == 1
      proper_fractions_found += 1
    else
      next
    end
  end

  proper_fractions_found
end

# check if it's reducable or not recusively
def recursive_gcd(numerator, denominator)
  if d != 0
    return n
  else
    return recursive_gcd(denominator, numerator % denominator)
  end
end

# Second optimization - Euler's totient function
