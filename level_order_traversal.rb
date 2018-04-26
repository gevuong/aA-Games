# Given a binary tree, return the level order traversal of its nodes' values. (ie, from left to right, level by level).

# For example:
# Given binary tree [3,9,20,null,null,15,7],
#     3
#    / \
#   9  20
#     /  \
#    15   7
# return its level order traversal as:
# [
#   [3],
#   [9,20],
#   [15,7]
# ]

class BTNode
    attr_reader :val
    attr_accessor :left, :right

    def initialize(val)
        @val = val
        @left, @right = nil, nil
    end
end

def level_order_traversal(root)
    return [] if root.nil?

    # initialize queue with root, 2d array, and nodes_per_level
    queue = [root]
    output_arr = [[root.val]]
    sub_arr = []

    while true
        return output_arr if queue.empty?

        output_arr.push(sub_arr) unless sub_arr.empty?

        sub_arr = [] # reset subarray
        nodes_per_level = queue.length # initially 1, which is root

        while nodes_per_level > 0
            root = queue.shift # FIFO

            if root.left
                queue.push(root.left)
                sub_arr.push(root.left.val)
            end

            if root.right
                queue.push(root.right)
                sub_arr.push(root.right.val)
            end

            nodes_per_level -= 1
        end
    end
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

p level_order_traversal(node_4) == [[4], [2, 5], [1, 3]]