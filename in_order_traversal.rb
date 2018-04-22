class BSTNode
    attr_accessor :val, :left, :right
    def initialize(val)
        @val = val
        @left, @right = nil, nil
    end
end

# Iterative solution
# Time: O(n), where n is number of nodes in BST
# Space: O(n), length of returned array. Otherwise, space is O(h), length of call stack.
def in_order_traversal(root)
    return [] if root.nil?

    # initialize array to store visited nodes in order
    stack = []
    in_order_arr = []

    while true
        # push left_child in stack until left_child = nil, that means you've reached minimum value
        if root
            stack.push(root)
            root = root.left

        else # de-stack, push root into array. set root to root's right_child. If right_child = nil, de-stack again
            return in_order_arr if stack.empty?
            root = stack.pop
            in_order_arr.push(root.val)            
            root = root.right
        end
    end

    in_order_arr
end


# recursive method
# Time: O(n), where n is number of nodes in BST, visit all nodes once
# Space: O(h), height of tree would be height of call stack. However, in this case, space is O(n), n being array containing all nodes in order

# did not set up base case because not sure how to push return value of each recursive call into base case [].
def in_order_traversal_rec(root)
    # return [] if root.nil?
    arr = []
    arr.concat(in_order_traversal_rec(root.left)) if root.left
    arr.push(root.val)
    arr.concat(in_order_traversal_rec(root.right)) if root.right
    arr
end

def pre_order_traversal_rec(root)
    # return [] if root.nil?
    arr = []
    arr.push(root.val)
    arr.concat(pre_order_traversal_rec(root.left)) if root.left
    arr.concat(pre_order_traversal_rec(root.right)) if root.right
    arr
end

def post_order_traversal_rec(root)
    # return [] if root.nil?
    arr = []
    arr.concat(post_order_traversal_rec(root.left)) if root.left
    arr.concat(post_order_traversal_rec(root.right)) if root.right
    arr.push(root.val)
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

p in_order_traversal(node_4) == [1, 2, 3, 4, 5]
p in_order_traversal_rec(node_4) == [1, 2, 3, 4, 5]
p pre_order_traversal_rec(node_4) == [4, 2, 1, 3, 5]
p post_order_traversal_rec(node_4) == [1, 3, 2, 5, 4]
