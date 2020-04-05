#The Odin Project: Ruby Programming
##Project: Data Structures and Algorithms

**Binary Search Trees**

Task: Build a simple binary search tree in this assignment. In this lesson, the tree won’t handle duplicate values as they are more complicated and result in trees that are much harder to balance. Be sure to always remove duplicate values or check for an existing value before inserting.

1. Build a Node class. It is should have attributes for the data it stores as well as its left and right children. As a bonus, try including the Comparable module and make nodes compare using their data attribute.
  1. *Every node contains the data/value and pointers to the right and left children. The initialize method will assign these three elements to every node.* 
2. Build a Tree class which accepts an array when initialized. The Tree class should have a root attribute which uses the return value of #build_tree which you’ll write next.
  1. *Wasn't sure on whether to build a sort method or not. To initially build a balanced binary search tree from an array, the array needs to be sorted. Just coming off the merge sort assignment, I thought that might be part of the task. After finding an article that compared various sorting algorithms to the native ruby sort, I've decided to utilize the native function that utilizes quicksort, which would be tough to beat with anything I could build. I'll use this assignment to focus on the binary search tree only.*
3. Write a #build_tree method which takes an array of data (e.g. [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]) and turns it into a balanced binary tree full of Node objects appropriately placed (don’t forget to sort and remove duplicates!). The #build_tree method should return the level-1 root node.
  1. *To ensure the tree was balanced, I set the root as the median of the array. I then recursively assigned the left child to be the median of the left subarray and the right child to be the median of the right subarray.* 
4. Write an #insert and #delete method which accepts a value to insert/delete (you’ll have to deal with several cases for delete such as when a node has children or not).
  1. *For #insert, started at the root and recursively checked if there was a right or left child, depending on which value was larger - the value supplied or the node in question. Once no child was found, a new node of the supplied value was created in the appropriate location.*
  2. *Before I made a #delete method, I created a #find method. Seemed logical that you'd first have to find a value (and verfiy it even existed) before deleting it. To #find, I just navigated through the tree by comparing value to node, and returned the node when it was found or false if it didn't exist.*
  3. *I was failing to delete the node by finding it and assigning the node to zero. After some more research on BSTs, I understood that to delete, you break the link from the parent. Since a child can't look back to its parent, like a parent can look on to its children, I created a #find_parent method to aid in deletion. It works just the same as the #find method, it just identifies the parent of a given node, rather than the node itself.*
  4. *I then looked at the 3 different cases of deletion: no children, 1 child, and 2 children. For no children, I simply deleted the link from the parent. For 1 child, I reassigned the link to the parent's grandchild. For 2 children, I created a #find_min method that would find the minimum value of the right subtree to replace the deleted node. That minimum then gets assigned as the parent's child and the deleted node's children become the minimum's children.* 
5. Write a #find method which accepts a value and returns the node with the given value.
  1. *I wrote the #find method before delete, as it seemed like a cleaner way to execute.*
6. Write a #level_order method which accepts a block. The method should traverse the tree in breadth-first level order and yield each node to the provided block. This method can be implemented using either iteration or recursion (try implementing both!). As a bonus, make the method return an array of values if no block is given. Tip: You will want to use an array acting as a queue to keep track of all the child nodes that you have yet to traverse and to add new ones to the list (as you saw in the video).
  1. *I went with an iterative approach for the #level_order method. I created a queue initially consisting of the root. As each node was de-queued, its children were en-queued. Each de-queued node either was input for a block or had its value stored in an array. This continued until the queue was empty.*
7. Write #inorder, #preorder, and #postorder methods which accept a block. Each method should traverse the tree in their respective depth-first order and yield each node to the provided block. As a bonus, make the method return an array of values if no block is given.
  1. *Recursive calls to traverse the tree and add the values to an array (or be input for a block). The three methods are nearly identical; just a rearrangement of 3 lines.*
8. Write a #depth method which accepts a node and returns the depth(number of levels) beneath the node.
  1. *As it's written, I'm not sure why this would be useful. Instead, I wrote a #depth method that returned what level the node existed, relative to the root. I mirrorred the #find method, and incremented the level variable each time the method was recursively called, signalling a new lower level.*
  2. *I do see how the suggested #depth method is useful for the next method, #balanced?. So I created a #depth_below method to satisfy the assignment and use for the next task.* 
9. Write a #balanced? method which checks if the tree is balanced. A balanced tree is one where the difference between heights of left subtree and right subtree is not more than 1.
  1. *With the #depth_below method, #balanced? was simple to create by checking if the difference between the left child depth and right child depth were greater than 1.*
10. Write a #rebalance! method which rebalances an unbalanced tree. Tip: You’ll want to create a level-order array of the tree before passing the array back into the #build_tree method.
  1. *Re-built the tree after creating a level-order array and sorting.*