# Given a list of numbers and a number k, return whether any two numbers from
# the list add up to k. For example, given [10, 15, 3, 7] and k of 17, return
# true since 10 + 7 is 17.
#
# Bonus: do this in a single pass
def contains_sum_pair? values, target
  values.each_with_index do |v, i|
    next unless v < target && i != values.length-1
    values[i..values.length-1].include?(target-v) ? (return true) : false
  end

  false
end

#  The trick to this being the more efficient solution is the implementation of
#  #include? on a Set veresus an Array
#  Array: https://ruby-doc.org/core-2.5.0/Array.html#method-i-include-3F
#  Set: https://ruby-doc.org/stdlib-2.6.3/libdoc/set/rdoc/Set.html#method-i-include-3F
#  note that set is not included by default so you'll have to require it
def bonus_contains_sum_pair? values, target
  set = Set.new

  values.each_with_index do |v, i|
    temp = target-values[i]
    if (temp >= 0) && (Set.include? temp)
      return true
    end
    set << values[i]
  end

  false
end

# you need to think more about variety of test cases rather than quantity.
# Looking at random instances of success is all well and good, but it's more
# important to identify different branches and edge cases
def driver
  all_zeroes = Array
  one_to_five = Array 1..5
  step_by_five_to_twenty = Array (0..20).step(5)

  expected_results = [true, true, false, false, false, true, true, true, false, false]
  actual_results = []

  actual_results << contains_sum_pair?(one_to_five, 9)
  actual_results << contains_sum_pair?(one_to_five, 4)
  actual_results << contains_sum_pair?(one_to_five, 10)
  actual_results << contains_sum_pair?(one_to_five, -1)
  actual_results << contains_sum_pair?(one_to_five, 1000)

  actual_results << contains_sum_pair?(step_by_five_to_twenty, 5)
  actual_results << contains_sum_pair?(step_by_five_to_twenty, 10)
  actual_results << contains_sum_pair?(step_by_five_to_twenty, 20)
  actual_results << contains_sum_pair?(step_by_five_to_twenty, -1)
  actual_results << contains_sum_pair?(step_by_five_to_twenty, -10)

  actual_results == expected_results ? 'hooray' : 'tests failing :('
end
