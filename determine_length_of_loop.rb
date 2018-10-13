# better solutions
def loop_size_best(node)
  tortoise = hare = node
  cycle_found = false
  loop_count = 0
  while(tortoise.next != nil && hare.next != nil && hare.next.next != nil) do
    tortoise = tortoise.next
    hare = hare.next.next
    if(tortoise == hare && cycle_found)
      break
    end
    if(tortoise==hare)
      cycle_found=true
    end
    loop_count+=1 if cycle_found
  end
  loop_count
end

# I liked this one the most
class Node
  attr_accessor :mark
end

def loop_size_clever(node)
  index = 0
  while node.mark == nil
    node.mark = index
    index += 1
    node = node.next
  end
  index - node.mark
end

# my solution below
def loop_size(node)
  visited_nodes = []
  visited_nodes, loop_start_index = iterate_nodes(node, visited_nodes)
  visited_nodes[loop_start_index..-1].length
end

def iterate_nodes(node, visited_nodes)
  if visited_nodes.include? node
    loop_start_index = visited_nodes.index(node)
    return visited_nodes, loop_start_index
  else
    visited_nodes << node
    iterate_nodes(node.next, visited_nodes)
  end
end

def iterate_nodes_while_loop(node, visited_nodes)
  while true
    if visited_nodes.include? node
      loop_start_index = visited_nodes.index(node)
      return visited_nodes, loop_start_index
    else
      visited_nodes << node
      node = node.next
    end
  end
end
