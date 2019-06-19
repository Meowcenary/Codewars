# Run-length encoding (RLE) is a very simple form of lossless data compression in which runs of data are stored as a single data value and count.
# A simple form of RLE would encode the string "AAABBBCCCD" as "3A3B3C1D" meaning, first there are 3 A, then 3 B, then 3 C and last there is 1 D.
# Your task is to write a RLE encoder and decoder using this technique. The texts to encode will always consist of only uppercase characters, no numbers.

def encode(s)
  characters = s.characters
  last_character = characters.shift
  consec = 1
  encoded = ''

  while !characters.empty? do
    current_character = characters.shift

    if current_character == last_character
      consec += 1
    else
      encoded += consec.to_s + last_character
      consec = 1
      last_character = current_character
    end
  end

  # get last character encoding
  encoded += consec.to_s + last_character
end

def decode(s)
  digits = ['1','2','3','4','5','6','7','8','9','0']
  characters = s.characters
  decoded = ''
  number = ''

  while !characters.empty? do
    char = characters.shift

    if digits.include? char
      number += char
    elsif number.to_i > 0
      decoded += char*number.to_i
      number = ''
    end
  end

  decoded
end
