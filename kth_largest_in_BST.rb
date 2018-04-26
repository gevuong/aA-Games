# Write an algorithm that, given a Binary Search Tree, will find the second largest node in the tree. Assume you already have a bst Node class with an insert method.

# Example:

#         _10_
#       _/    \_          
#      5        15
#     / \       / \
#    3   8     12  20
#   /     \         \
#  2       4        30

# Output: 20


#      10
#     /  
#    5
#   / \
#  3   7

# Output: 7

class BSTNode 
    attr_accessor :left, :right 
    attr_reader :val 
    def initialize(val)
        @val = val
        @left, @right = nil, nil
    end 
end 


def kth_largest_node(root, k)
    # in order_traversal then index array[-2]
    arr = in_order_traversal(root)
    arr[arr.length - k]
end 

def in_order_traversal(root)
    return [] if root.nil?
    arr = []
    arr.concat(in_order_traversal(root.left))
    arr.push(root.val)
    arr.concat(in_order_traversal(root.right))
    arr
end

# Test Case 1 
node_10 = BSTNode.new(10)
node_5 = BSTNode.new(5)
node_3 = BSTNode.new(3)
node_8 = BSTNode.new(8)
node_4 = BSTNode.new(4)
node_2 = BSTNode.new(2)
node_12 = BSTNode.new(12)
node_15 = BSTNode.new(15)
node_20 = BSTNode.new(20)
node_30 = BSTNode.new(30)

node_10.left = node_5 
node_5.left = node_3 
node_5.right = node_8 
node_3.left = node_2 
node_8.right = node_4

node_10.right = node_15 
node_15.left = node_12 
node_15.right = node_20 
node_20.right = node_30

p kth_largest_node(node_10, 2) == 20

# Test Case 2 
node_10 = BSTNode.new(10)
node_5 = BSTNode.new(5)
node_3 = BSTNode.new(3)
node_7 = BSTNode.new(7)

node_10.left = node_5
node_5.left = node_3 
node_5.right = node_7

p kth_largest_node(node_10, 2) == 7