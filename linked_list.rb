# This is not perfect and hasn't been cleaned up. Notes from 8/15/2019
# Topics covered:
# Singly linked lists, doubly linked lists, adding/deleting and detecting cycles

class LinkedList
  def initialize(value)
    @head = Node.new(value)
  end

  def add(value)
    current_node = @head
    while(current_node.next != nil)
      current_node = current_node.next
    end
    current_node.next = Node.new(value)
  end

  def delete(value)
    current_node = @head
    prev_node = nil
    while(current_node != nil)
      if(current_node.val == value)
        if(prev_node == nil)
          @head = current_node.next
        else
          prev_node.next = current_node.next
        end
        break
      end
      prev_node = current_node
      current_node = current_node.next
    end
  end

  def has_cycle?
    tortoise = @head
    hare = @head

    while(tortoise != hare && tortoise != nil && hare != nil && hare.next != nil)
      tortoise = tortoise.next
      hare = hare.next.next
      if tortoise == hare && tortoise != nil
        return true
      end
    end
    return false
  end

  def print
    current_node = @head
    while(current_node != nil)
      puts "Next code: #{current_node.val}"
      current_node = current_node.next
    end
  end
end

class Node
  attr_accessor :val, :next

  def initialize(value, next_node = nil)
    @val = value
    @next = next_node
  end
end

# puts "ADDING"
# linked_list = LinkedList.new(5)
# linked_list.add(6)
# linked_list.add(7)
# linked_list.print

# puts "DELETING"
# # linked_list.delete(6)
# linked_list.delete(5)
# linked_list.print


def has_cycle?(head)
  tortoise = head
  hare = head

  while(tortoise != nil && hare != nil && hare.next != nil)
    tortoise = tortoise.next
    hare = hare.next.next
    if tortoise == hare && tortoise != nil
      return true
    end
  end
  return false
end

# puts "HAS CYCLE EXPECT TRUE"
# @head = Node.new(7)
# @head.next = Node.new(8)
# @head.next.next = Node.new(9)
#
# @head.next.next.next = @head.next
# puts has_cycle?(@head)
#

#puts "HAS CYCLE EXPECT FALSE"
# @head = Node.new(7)
# @head.next = Node.new(8)
# @head.next.next = Node.new(9)
#
# # @head.next.next.next = @head.next
# puts has_cycle?(@head)
