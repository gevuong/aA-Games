# Given a binary tree, find its maximum depth.
#
# The maximum depth is the number of nodes along the longest path from the root node down to the farthest leaf node.
#
# Note: A leaf is a node with no children.

# Example:
#
# Given binary tree [3,9,20,null,null,15,7],
#
#     3
#    / \
#   9  20
#     /  \
#    15   7
# return its depth = 3.


class BTNode
    attr_accessor :val, :left, :right
    def initialize(val)
        @val = val
        @left = nil
        @right = nil
    end
end

# iterative solution
# Time: O(n), where n is number of nodes. We visit each node once. Outer while loop processes are constant.
# Space: O(n), where n is length of node_queue, eventually it's empty
def max_depth_of_btree(root)
    # return 0 if root is nil. Don't need to check root.left.nil? && root.right.nil? because root may already be nilClass.
    return 0 if root.nil?

    # initialize depth_count and node_queue. The idea is to traverse tree level by level, pushing children into node_queue. BFS essentially.
    depth_count = 0
    node_queue = [root]

    while true
        # store number of nodes at each level (i.e. at root, node_count = 1)
        node_count = node_queue.length

        # check if there are any remaining children
        return depth_count if node_count == 0
        depth_count += 1

        # iterate until all nodes in level are dequeued
        while node_count > 0
            # dequeue
            root = node_queue.shift
            left_child = root.left
            right_child = root.right

            # enqueue
            node_queue.push(left_child) if left_child
            node_queue.push(right_child) if right_child

            # reduce count as each node in level is dequeued
            node_count -= 1
        end
    end
end


# recursive solution
# Time: O(n), where n is number of nodes in BT because we visit all nodes once
# Space: O(n), where n is height of BT, which is the length of call stack
# If we don't consider size of call stack, then space is O(1).
def max_depth_of_btree_rec(root)
    return 0 if root.nil?
    left_depth_count = max_depth_of_btree_rec(root.left)
    right_depth_count = max_depth_of_btree_rec(root.right)

    # a tree that only contains root as a depth of 1 
    [left_depth_count, right_depth_count].max + 1
end


# Test case
node_1 = BTNode.new(1)
node_2 = BTNode.new(2)
node_3 = BTNode.new(3)
node_1.left = node_2
node_1.right = node_3
node_4 = BTNode.new(4)
node_2.left = node_4
node_5 = BTNode.new(5)
node_3.right = node_5

p max_depth_of_btree(node_1) == 3
p max_depth_of_btree_rec(node_1) == 3
