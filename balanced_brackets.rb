# another stack problem
def balanced_brackets? string
  stack = []

  brackets = {']': '[', '}': '{', ')': '('}
  string.split('').each do |char|
    # if opening bracket add to stack
    if brackets.values.include? char
      stack << char
    # if close bracket then pop the stack and check if matching pair
    else
      to_compare = stack.pop
      if to_compare && (brackets[char.to_sym] == to_compare)
        next
      else
       return false
      end
    end
  end

  stack.empty?
end
