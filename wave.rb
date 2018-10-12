#
# solution that was better than mine
#
def best_practice_solution(str)
  result = []
  chars = str.downcase.chars
  chars.each_with_index do |char, idx|
    next if char == " "
    result << str[0...idx] + char.upcase + str[idx+1..-1]
  end
  result
end

#
# What I came up with
#
def wave(str)
  arr = []

  str.split('').each_with_index do |c, i|
    if blank_char?(c)
      arr << upcase_at_index(str, i)
    end
  end

  arr
end

def upcase_at_index(str, index)
  str.slice(0, index) + str[index].upcase + str.slice(index + 1, str.length)
end

def !blank_char?(c)
  c == ' '
end
