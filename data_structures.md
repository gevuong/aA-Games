- BST
    - #find() - log(n)
    - #insert() - log(n)
    - #delete() - log(n)
    
    - kth largest node
        - keep a count
        - keep reference to correct node


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
