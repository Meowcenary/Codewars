class Node
  attr_accessor :data, :next_node

  def initialize data, next_node
    @data = data
    @next_node = next_node
  end
end

class LruCache
  # singly linked list represents cache
  # tail is most recently used (mru)
  # head is least recently used (lru)
  def initialize head, max_size
    @max_size = max_size
    @head = head
    @tail = head
    set_initial_tail
  end

  # allow instantiation with chain of nodes
  def set_initial_tail
    while @tail.next_node
      @tail = @tail.next_node
    end
  end

  def print_lru_to_mru
    current_node = @head

    while current_node do
      puts current_node.data
      current_node = current_node.next_node
    end
  end

  def remove_lru
    @head = @head.next_node
  end

  def add_to_cache node
    @tail.next_node = node
    @tail = node
  end

  def find_data data
    follower = nil
    current_node = @head

    while current_node do
      if current_node.data == data
        update_cache current_node, follower
        return current_node
      else
        follower = current_node
        current_node = current_node.next_node
      end
    end
  end

  private

  def update_cache accessed, follower
    if accessed == @head && @head == @tail
      # puts 'do nothing, head == tail'
      return
    elsif accessed == @head
      # puts 'moving head forward one'
      @head = accessed.next_node
    else
      # puts 'assigning follower new next'
      follower.next_node = accessed.next_node
    end

    @tail.next_node = accessed
    @tail = accessed
    @tail.next_node = nil
  end
end
