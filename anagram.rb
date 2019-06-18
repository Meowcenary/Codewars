# another stack problem
def is_anagram? str
  stack = []
  letters = str.split ''

  letters.each_with_index do |letter, index|
    if index < (str.length/2)
      stack << letter
    elsif (index + 1) == (str.length/2 + str.length%2)
      next
    else
      compare_letter = stack.pop

      if letter != compare_letter
        return false
      end
    end
  end

  true
end
