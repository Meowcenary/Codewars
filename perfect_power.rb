def isPP(n)
  for a in (2..n) do
    for b in (2..n) do
      return [a,b] if (a**b) == n
      break if (a**b)>n
    end
    return nil if (a**2)>n
  end
end
