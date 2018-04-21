## BST (Binary Search Trees)

### Types of Trees
- complete:
    - every level of the tree is fully filled, except for the last level. If last level is filled, it is filled from left to right.
- full
    - has either zero or two children. No nodes have only one child.
- perfect
    - a tree that is both full and complete.

### Types of Traversal
- in-order (most widely used)
    - touches all nodes in BST in order from least to greatest.
    - traverses to the lowest level along left branch, touches left child, then root node of that sub-tree, then right node of sub-tree.
- pre-order
    - touches top node first, then traverses left branch, touching every left child until it reaches the bottom, then touches the right child of each sub-tree along left branch, working its way back up to top node, then traverses the right branch of BST, and repeats traversal pattern done on left branch.
- post-order  
    - great for safely deleting nodes from a BST because it starts from the lowest level and works its way up.
    - first touches lowest level of left branch, touching left child of each sub-tree, right child of each sub-tree, then parent node of each sub-tree.
    - Then touches lowest level of right branch, touching left child of each sub-tree, right child of each sub-tree, then parent node of each sub-tree, finally reaching the top node of original BST.

### What you need to know

- #find() - log(n)
- #insert() - log(n)
- #delete() - log(n)

    - kth largest node
        - keep a count
        - keep reference to correct node


## Heap
### What is a Binary Heap?

- A complete binary tree that satisfies the heap ordering property (min-heap or max-heap).
- **Reminder**: a complete binary tree is a tree where every level of the tree is fully filled, except for the last level. If last level is filled, it is filled from left to right.


- The **heap ordering property** can be of two types:
    - min-heap
        - value of each node must be greater than or equal to value of its parent
        - min value is at the root
    - max-heap  
        - value of each node <= value of its parent
        - max value is at the root

- For the purposes of this article, the word "heap" will always refer to min-heap.


### In what applications would I use a binary heap?
- Heapsort (in-place sorting method )
- Priority Queues


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
