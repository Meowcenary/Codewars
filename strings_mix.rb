def mix(s1, s2)
  s1_counts = char_counts s1
  s2_counts = char_counts s2

  max_counts = (s1_counts.keys.concat s2_counts.keys).uniq.map do |key|
    val1, val2 = s1_counts[key], s2_counts[key]
    if val1 == val2
      "=:#{key}"
    else
      val1 > val2 ? "#{val1}:#{key}" : "#{val2}:#{key}"
    end
  end

  max_counts.join('/')
end

def char_counts string
  char_counts = {}
  char_counts.default_proc = proc { 0 }

  string.chars.each do |char|
    char_counts[char.to_sym] += 1 if is_lower? char
  end

  char_counts
end

def is_lower? char
  ('a'..'z').include? char
end
