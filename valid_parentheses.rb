def best_practice_valid_parentheses(string)
  open = 0
  string.chars.each do |c|
    open += 1 if c == "("
    open -= 1 if c == ")"
    return false if open < 0
  end
  open == 0
end

# initial_attempt. I'm pretty happy with this overall, but notes are written in
# where improvements could be made
def valid_parentheses(string)
  # not really necessary for the challenge, but not necessarily hurting things
  # either I guess
  return false unless valid_input? string

  # the previous character doesnt change the validity of parentheses and can be
  # omitted entirely
  prev_char = ''
  open = 0

  # the run time is going to scale with the size of the string so it's not that
  # helpful to remove the alphanumeric characters
  # use #chars instead of #split to grab all the characters
  remove_alphanumeric(string).split('').each do |char|
    # open? / close? are unecessary functions that just clutter things
    if open?(char)
      open += 1
    # as above remove references to previous character
    elsif close?(char) && (prev_char.empty? || open <= 0)
      return false
    elsif close?(char)
      open -= 1
    end

    # this added a ton of lines for no reason :/
    prev_char = char
  end

  open == 0
end

def open? char
  char == '('
end

def close? char
  char == ')'
end

def remove_alphanumeric string
  string.gsub(/[\n0-9a-z]/i, '').strip
end

def valid_input? string
  0 <= string.length && string.length <= 100
end
