class BTNode
    attr_accessor :val, :left, :right
    def initialize(val)
        @val = val
        @left, @right = nil, nil
    end
end


# recursive method
# Time: O(n), where n is number of nodes in BST, visit all nodes once
# Space: O(h), height of tree would be height of call stack. However, in this case, space is O(n), n being array containing all nodes in order

# did not set up base case because not sure how to push return value of each recursive call into base case [].
def pre_order_traversal_rec(root)
    # return [] if root.nil?
    arr = []
    arr.push(root.val)
    arr.concat(pre_order_traversal_rec(root.left)) if root.left
    arr.concat(pre_order_traversal_rec(root.right)) if root.right
    arr
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

p pre_order_traversal_rec(node_4) == [4, 2, 1, 3, 5]