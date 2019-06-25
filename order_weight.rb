# my initial solution
def order_weight(strng)
  weights = strng.split(' ').map do |number|
    [number, number.chars.sum{ |char| char.to_i }]
  end

  weights.sort_by{ |weight| [weight.last, weight.first] }.map(&:first).join(' ')
end

# best practice solution
def order_weight(string)
  string.split.sort_by { |n| [n.chars.map(&:to_i).reduce(:+), n] }.join(" ")
end
