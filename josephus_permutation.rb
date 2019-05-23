# this makes the most sense to me everything relies on using the rotate
# function, without that I think I'm not sure how you would solve this
def josephus(items,k)
  arr = []
  while items.size > 0 do
    items = items.rotate(k)
    arr << items.pop
  end
  arr
end
