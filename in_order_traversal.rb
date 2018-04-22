class BSTNode
    attr_accessor :val, :left, :right
    def initialize(val)
        @val = val
        @left, @right = nil, nil
    end
end

# Iterative solution
# Time: O(n), where n is number of nodes in BST
# Space: O(h), worst case would be height of stack. However, since we're returning an array of all nodes, then space is O(n).
def in_order_traversal(root)
    return [] if root.nil?

    # initialize array to store visited nodes in order
    stack = []
    in_order_arr = []

    current_node = root

    while true
        # push left_child in stack until left_child = nil, that means you've reached minimum value
        if current_node
            stack.push(current_node)
            
            # set current_node to left child
            left_child = current_node.left
            current_node = left_child

        else # begin to de-stack, push root into array, look at root's right_child. If right_child = nil, enter else statement and destack again. 
            return in_order_arr if stack.empty?
            root = stack.pop
            in_order_arr.push(root.val)
            
            right_child = root.right
            current_node = right_child
        end
    end

    in_order_arr
end


# recursive method
# Time: O(n), where n is number of nodes in BST, visit all nodes once
# Space: O(h), height of tree would be height of call stack. However, in this case, space is O(n), n being array containing all nodes in order
# did not set up base case because wasn't sure how to push recursive call into base case [].
def in_order_traversal_rec(root)
    # return [] if root.nil?
    arr = []
    arr.concat(in_order_traversal_rec(root.left)) if root.left
    arr.push(root.val)
    arr.concat(in_order_traversal_rec(root.right)) if root.right
    arr
end


node_1 = BSTNode.new(1)
node_2 = BSTNode.new(2)
node_3 = BSTNode.new(3)
node_4 = BSTNode.new(4)
node_5 = BSTNode.new(5)

node_4.left = node_2
node_2.left = node_1
node_2.right = node_3
node_4.right = node_5

p in_order_traversal(node_4)
p in_order_traversal_rec(node_4)
