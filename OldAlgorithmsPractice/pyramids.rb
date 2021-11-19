# Given a number of bricks, output the total number of 2d pyramids possible, where a pyramid is defined as any
# structure where a row of bricks has strictly less bricks than the row below it. You do not have to use all
# the bricks.
#
# A 'brick' is simply a square, pyramids with large bases and even one block on top are valid

# the important bit of information to use here is the base since that is the defining aspect of the pyramid

# f(n, m) = number of pyramids out of n bricks with base size < m
# defining N as number of bricks provided, the function we get next is
# using N+1 as m becuase that would put us at pyramids made with only a base
# f(N, N+1)

# the actual recursive formula to solve the problem is below
# f(n, m) = sum f(n - i, i) for 0 <= i <= min(n, m - 1)
# def pyramids(bricks, base)
#   N = 0

# end


# int calc(int left, int last) {
#     int total=0;
#     if(left<=0) return 0;  // terminal case, no pyramid with no brick
#     for(int i=last+1; i<=left; i++) {
#         total+=1+calc(left-i,i);
#     }
#     return total;
# }

def print_status(bricks_left, last_row_bricks)
  puts "Bricks Left: #{bricks_left}\nLast Row Bricks: #{last_row_bricks}\n\n"
end

def calc(bricks_left, last_row_bricks)
  total = 0

  print_status(bricks_left, last_row_bricks)

  if(bricks_left <= 0)
    return 0
  end

  i = last_row_bricks + 1
  while(i <= bricks_left)
    puts 'entered loop'
    total += 1 + calc(bricks_left - i, i)
    i += 1
  end

  return total
end

puts calc(6, 0)
