def best_solution
  string.downcase.chars.uniq == string.downcase.chars
end

def is_isogram(string)
  return true if string.strip == ''

  string.downcase!

  string.chars.each do |c|
    if string.count(c) > 1
      return false
    end
  end

  true
end
