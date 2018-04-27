# Reverse a singly linked list

class Node  
    attr_accessor :next  
    attr_reader :val 
    def initialize(val)
        @val = val 
        @next = nil
    end 
end 

class LinkedList 
    def initialize
        @head = Node.new
        @tail = Node.new
        @head.next = @tail
    end 
end 


# Time: O(n), where n is number of Nodes in LL
# Space: O(1), because we are only storing one node in a variable
def reverse_LL(head)
    current = head
    prev = nil

    while current 
        # store next_node before changing its reference to prev
        next_node = current.next
        
        # change current's NEXT POINTER to point to its previous element. To be clear, you're not modifying the next Node in any way to equal prev, only current's NEXT POINTER. 
        # In other words, assuming all nodes point to the right beginning at the head, you're setting current.next to point to the left of head, which is nil, or prev.
        current.next = prev 

        # before re-entering while loop, set prev to current, and current to next_node to traverse LL
        prev = current 
        current = next_node
    end
    
    # return new head
    prev
end 


# test case 
LL = LinkedList.new
