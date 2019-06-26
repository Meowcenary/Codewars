# Given an array of arrays return the number of unique arrays that can be formed by picking exactly one element from each subarray.
# For example: solve([[1,2],[4],[5,6]]) = 4, because it results in only 4 possiblites. They are [1,4,5],[1,4,6],[2,4,5],[2,4,6].
# Make sure that you don't count duplicates; for example solve([[1,2],[4,4],[5,6,6]]) = 4, since the extra outcomes are just duplicates.
#  test cases...
#  Test.assert_equals(solve([[1,2],[4],[5,6]]),4)
#  Test.assert_equals(solve([[1,2],[4,4],[5,6,6]]),4)
#  Test.assert_equals(solve([[1,2],[3,4],[5,6]]),8)
#  Test.assert_equals(solve([[1,2,3],[3,4,6,6,7],[8,9,10,12,5,6]]),72)
# take advantage of 'Rule of Products' to solve this without bruteforcing it
def solve(arr)
  arr.reduce(1){ |combinations, sub_arr| combinations *= sub_arr.uniq.length }
end
