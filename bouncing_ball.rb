# a one line solution
def bouncing_ball_one_line_solution(h, bounce, window)
  bounce < 0 || bounce >= 1 || h <= window || window < 0 ? -1 : bouncingBall(h * bounce, bounce, window) + 2
end

# all params floats
def bouncingBall(h, bounce, window)
  # validate params, notice that you can't do 0 < bounce < 1 because
  # ruby will evaulate 0 < bounce to true; true < 1 is not valid after.
  puts h, bounce, window

  return -1 if h <= 0 || 0 >= bounce || bounce >= 1 || window > h

  rebound_height = h
  # the initial drop
  window_passes = 0

  while rebound_height > window
    # falling
    window_passes += 1

    rebound_height = rebound_height(rebound_height, bounce)

    # bounce back up
    window_passes += 1 if rebound_past_window?(rebound_height, window)
  end

  window_passes
end

def rebound_height(rebound_height, bounce)
  rebound_height * bounce
end

def rebound_past_window?(rebound_height, window)
  rebound_height > window ? true : false
end

