# Initial attempt
def expanded_form(num)
  digits = num.to_s.split("")
  expanded_form_nums = []

  while !digits.empty? do
    digit = digits.shift

    if digit != "0"
      expanded_form_nums << digit + "0"*digits.length
    end
  end

  expanded_form_nums.join(" + ")
end
