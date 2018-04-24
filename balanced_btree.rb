# Given a binary tree, determine if it is height-balanced.

# For this problem, a height-balanced binary tree is defined as:

# a binary tree in which the depth of the two subtrees of every node never differ by more than 1. This is the height-balancing scheme used in AVL trees.

# For more info: https://www.geeksforgeeks.org/how-to-determine-if-a-binary-tree-is-balanced/

# Example 1:

# Given the following tree [3,9,20,null,null,15,7]:

#     3
#    / \
#   9  20
#     /  \
#    15   7
# Return true.

# Example 2:

# Given the following tree [1,2,2,3,3,null,null,4,4]:

#        1
#       / \
#      2   2
#     / \
#    3   3
#   / \
#  4   4
# Return false.


class BTNode
    attr_accessor :left, :right
    attr_reader :val
    def initialize(val)
        @val = val
        @left, @right = nil, nil
    end
end


# Runtime on LeetCode is 116ms...beat 5.88% of all Ruby submissions...but it works.
# Time: O(n^3), where n is number of nodes in btree
# Space: O(n), where n is length of node_arr after traversal. Otherwise, I think space would be O(H), where H is height of btree when processing depth_of_subtree or in_order_traversal
def is_balanced?(root)
    return true if root.nil? # an empty tree is balanced
    
    # First, traverse btree, and return array of all nodes
    # Time: O(n), where n is number of nodes. We visit all nodes once
    # Space: O(n), where n is length of array of nodes
    node_arr = in_order_traversal(root)

    # iterate node_arr, and plug in each node into depth_of_subtree.
    # O(n^3), each depth_of_subtree call is O(n) time
    node_arr.each do |node|
        # find max height of left_subtree
        left_depth = depth_of_subtree(node.left)
        right_depth = depth_of_subtree(node.right)
        # find max height of right_subtree
        return false if (left_depth - right_depth).abs > 1
    end 
    true
end 

# helper methods
# Time: O(n), where n is number of nodes in given binary tree.
# Space: O(1), excluding length of call stack
def depth_of_subtree(root)
    return 0 if root.nil?

    # find max height of left_subtree
    left_depth = depth_of_subtree(root.left)
    right_depth = depth_of_subtree(root.right)

    [left_depth, right_depth].max + 1
end 


def in_order_traversal(root)
    return [] if root.nil? 
    arr = []
    arr.concat(in_order_traversal(root.left))
    arr.push(root)
    arr.concat(in_order_traversal(root.right))
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

p is_balanced?(node_4)