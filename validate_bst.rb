# Given a binary tree, determine if it is a valid binary search tree (BST).
#
# Assume a BST is defined as follows:
#
# The left subtree of a node contains only nodes with keys less than the node's key.
# The right subtree of a node contains only nodes with keys greater than the node's key.
# Both the left and right subtrees must also be binary search trees.
# Example 1:
#
# Input:
#     2
#    / \
#   1   3
# Output: true
# Example 2:
#
#     5
#    / \
#   1   4
#      / \
#     3   6
# Output: false
# Explanation: The input is: [5,1,4,null,null,3,6]. The root node's value
#              is 5 but its right child's value is 4.


class BTNode
    attr_reader :val
    attr_accessor :left, :right
    def initialize(val)
        @val = val
        @left, @right = nil, nil
    end
end

# iterative solution
# Time: O(n), where n is number of nodes in BST
# Time: O()
# assume all nodes are not unique. Plan of Action: create in order traversal. Prior to pushing value into in_order array, compare current_nodes value with min value in in_order array
def is_valid_bst?(root)
    return true if root.nil? # based on leetCode test case, return true even if root is nil
    return true if root.left.nil? && root.right.nil?

    # initialize an empty stack and current_node 
    stack = []
    in_order_arr = []
    prev_node = nil

    while true
        # push left_child into stack until left_child is nil. This means you have 
        if root
            stack.push(root) 
            root = root.left

        else # de-stack and update current_node as right_child
            return true if stack.empty?
            root = stack.pop

            if prev_node # skips initial iteration when prev_node = nil
                return false if root.val <= prev_node.val
            end 

            in_order_arr.push(root.val)

            prev_node = root
            root = root.right
        end 
    end 
end


# recursive solution
def is_valid_bst_rec?(root)

end 

# Test case
node_1 = BTNode.new(1)
node_2 = BTNode.new(2)
node_3 = BTNode.new(3)
node_4 = BTNode.new(4)
node_5 = BTNode.new(5)

node_4.left = node_2
node_2.left = node_1
node_2.right = node_3
node_4.right = node_5

p is_valid_bst?(node_4)  == true
p is_valid_bst?(node_2)  == true
p is_valid_bst?(node_3)  == true

