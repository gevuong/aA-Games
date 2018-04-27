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


def reverse_LL(head)
    current = head
    prev = nil

    while current 
        next_node = current.next
        current.next = prev 
        prev = current 
        current - next_node
    end
    
    prev
end 


# test case 
LL = LinkedList.new
