# best practice solution, mine was too terrible to bother saving
def get_char_presses(c)
  # when you finish looping through letters
  # it should return the number of the keypad
  buttons = [ '1',     'ABC2', 'DEF3',
              'GHI4',  'JKL5', 'MNO6',
              'PQRS7', 'TUV8', 'WXYZ9',
              '*',     ' 0',   '#' ]
  # res will be nil if nothing found
  # when found add 1 for array indexing at 0
  buttons.each { |b| if (res = b.index(c)) then return res + 1; end }
end

def presses(phrase)
  # collect and map are the same
  # reduce combines everything applying given operation
  phrase.chars.collect { |c| get_char_presses c.upcase }.reduce(:+)
end
