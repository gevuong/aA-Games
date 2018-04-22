
### Table of Contents
- BST
- Binary Heap
- Linked List


## Tree
- A tree is actually a type of graph.
- Each tree has a root node. The root node has zero or more child nodes.
- Cannot contain cycles
- Nodes may or may not be in a particular order
- Can have any data types as values

### What is a BST?
- All left descendants of root are less than or equal to root. All right descendants of root are greater than or equal to root.
- Definition varies slightly with respect to equality. The following are various valid definitions, but be sure to clarify with interviewer.
    - tree cannot have duplicate values
    - duplicate values will be on the right side of root
    - duplicate values will be on the left side of root

### Types of Trees
- complete
    - every level of the tree is fully filled, except for the last level. If last level is filled, it is filled from left to right.
- full
    - nodes have either zero or two children. No nodes have only one child.
- perfect
    - a tree that is both full and complete.
- balanced
    - height of left and right subtrees of any node never differ by more than one


### Types of Traversal
- **in-order (most widely used)**
    - If traversing a **BST**, touches all nodes in order from least to greatest.
    - traverse to the lowest level along left branch, touches left child, then root node of that sub-tree, then right node of sub-tree, and works its way back up to top node.


    - Implementation
        1. traverse left subtree (i.e. call in_order(left_subtree))
        2. visit root
        3. traverse right subtree (i.e. call in_order(right_subtree))


- **pre-order**
    - touches top node first, then traverses left branch, **touching every left child until it reaches the bottom,** then touches the right child of each sub-tree along left branch, working its way back up to top node.
    - traverses the right branch of BST, and repeats traversal pattern done on left branch.


    - Implementation
        1. visit root
        2. traverse left subtree (i.e. call pre_order(left_subtree))
        3. traverse right subtree( i.e. call pre_order(right_subtree))


- **post-order**  
    - first touches lowest level of left branch, touching left child of each sub-tree, right child of each sub-tree, then parent node of each sub-tree.
    - Then touches lowest level of right branch, touching left child of each sub-tree, right child of each sub-tree, then parent node of each sub-tree, finally reaching the top node of original BST.
    - great for safely deleting nodes from a BST because it starts from the lowest level and works its way up.


    - Implementation
        1. traverse left subtree (i.e. call post_order(left_subtree))
        2. traverse right subtree (i.e. call post_order(right_subtree))
        3. visit root


- Example:

![Example Tree](images/example_tree.gif)

    - in_order (left, root, right): 4 2 5 1 3
    - pre_order (root, left, right): 1 2 4 5 3
    - post_order (left, right, root): 4 5 2 3 1

- Time Complexity: O(n), where n is number of nodes
- Space Complexity: O(1) if we don't consider size of stack for function calls, otherwise O(n)


- Example 2:

![Example 2 Tree](images/better_example_tree.png)


### What you need to know about BSTs

- #find() - log(n) time
- #insert() - log(n) time
- #delete() - log(n) time

    - kth largest node
        - keep a count
        - keep reference to correct node


## Heap
### What is a Binary Heap?
- A **complete binary tree** that satisfies the heap ordering property (min-heap or max-heap). In other words, a binary heap is either a min-heap or max-heap.
- **Reminder**: a complete binary tree is a tree where every level of the tree is fully filled, except for the last level. If last level is filled, it is filled from left to right.
- structure does not have to be sorted

- The **heap ordering property** can be of two types:
    - min-heap
        - value of each node must be greater than or equal to value of its parent
        - min value is at the root
    - max-heap  
        - value of each node <= value of its parent
        - max value is at the root

- Another way of looking at a binary heap is that he highest (or lowest) priority element is always stored at the root.
- For the purposes of this article, the word "heap" will always refer to min-heap.


### In what applications would you use a binary heap?
- Heapsort (in-place sorting method )
- Priority Queues (removing the object with highest or lowest priority)


## Linked Lists
- Linked list
    - find O(n)
    - indexing is O(n)
    - push O(1)
    - unshift O(1)

    Given the prev or next of node you want to get rid of. If you reference to the node.
    - delete O(1)
    - insert O(1)

Sentinel node strategy. They are dummy nodes, placeholders. So you don't ever have to check if there's no head or no tails. If you add a node, it gets placed between the dummy nodes, and you have the sentinel nodes (head and tail) point to recently added node.


### How do you build a hashmap?
- It is a mapping of keys that point to values.
- Start with an array of buckets. [[], [], [], []]. Each bucket is a LL.
- Each node in a LL stores a key, a value, next, and prev.
- Keys are unique. So you can mod by the hashed key (i.e. key.hash % num_buckets) to prevent collisions. Hashing the same key will always produce the same output, it's consistent, it never changes.

- All you need is a get and set. set checks to see if a key already exists, and also assign a new key if it doesn't. So it does both things.

### Do we really need a LL to implement a hashmap?
- No, you can use arrays and tuples within the buckets instead. However, when we consider LRU caching, it can only be done with a LL.
