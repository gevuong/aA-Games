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
    end 
end 


def reverse_LL(LL)
    current = LL.head
    prev = nil
    while current 
        next_node = current.next
        current.next = prev 
        prev = current 
        current - next_node
    end
    
    prev
end 