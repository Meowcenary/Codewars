def lcs(xstr, ystr)
  return "" if xstr.empty? || ystr.empty?

  #take the first character of each string x,y
  #take the rest of the string xs, ys
  x, xs, y, ys = xstr[0..0], xstr[1..-1], ystr[0..0], ystr[1..-1]

  #if the characters match take lcs of the remaining string
  if x == y
    x + lcs(xs, ys)

  #otherwise take the max subsequence of
  #the original xstring and what remains of the ystring
  #the original ytsring and what remains of the xstring
  else
    [lcs(xstr, ys), lcs(xs, ystr)].max_by {|x| x.size}
  end
end
