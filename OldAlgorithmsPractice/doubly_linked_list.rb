class Node
  attr_accessor :val, :next_node

  def initialize(val, prev_node, next_node)
    @val = val
    @prev_node = prev_node
    @next_node = next_node
  end
end

class DoublyLinkedList
  def initialize(val)
    @head = Node.new(val, nil, nil)

    @head.print
  end

  def insert(val)
    current = @head

    while !current.next_node.nil?
      current = current.next_node
    end

    current.next_node = Node.new(val, current, nil)
  end

  #WIP

  # def delete(val)
  #   current = @head

  #   #delete head
  #   if current.val == val
  #     @head = current.next_node
  #     @head.prev_node = nil
  #   else
  #     while !current.next_node.nil? && current.next_node.val != val
  #       current = current.next_node
  #     end

  #     unless current.next_node.nil?
  #       current.next_node = current.next_node.next_node
  #       current.next_node.next_node.prev_node =
  #     end
  #   end
  # end

  def return_list
    elements = []
    current = @head

    while current.next_node != nil
      elements << current
      current = current.next_node
    end

    elements << current
  end

  def print
    puts self.return_list.map{|node| node.val.to_s}.join(" ")
  end
end

#very basic tests

puts 'test init and insert'
list = DoublyLinkedList.new(1)
list.insert(2)
list.insert(3)
list.insert(4)
list.insert(5)
list.print
