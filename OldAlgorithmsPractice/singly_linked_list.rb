class Node
  attr_accessor :val, :next_node

  def initialize(val, next_node)
    @val = val
    @next_node = next_node
  end
end

class SinglyLinkedList
  attr_accessor :head

  def initialize(val)
    @head = Node.new(val, nil)
  end

  def insert(val)
    current = @head

    #search until found last node
    while !current.next_node.nil?
      current = current.next_node
    end

    #always append to the last node in the list
    current.next_node = Node.new(val, nil)
  end

  def delete(val)
    current = @head

    #delete head
    if current.val == val
      @head = current.next_node
    else
      while !current.next_node.nil? && current.next_node.val != val
        current = current.next_node
      end

      unless current.next_node.nil?
        current.next_node = current.next_node.next_node
      end
    end
  end

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
list = SinglyLinkedList.new(1)
list.insert(2)
list.insert(3)
list.insert(4)
list.insert(5)
list.print

puts 'test delete when val is head'
list.delete(1)
list.print

puts 'test delete when val is last'
list.delete(5)
list.print

puts 'delete when val is not in list'
list.delete(6)
list.print

puts 'test delete for val in between'
list.delete(3)
list.print
