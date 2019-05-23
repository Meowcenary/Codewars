# this problem requires understanding the call method without it there is no way
# to solve this that I can think of
#
# the end goal is to be able to call add(n).(n2).(n3).(n4)...
def add(n)
  n
end

class Fixnum
  def call(m=0)
    puts m
    self + m
  end
end
