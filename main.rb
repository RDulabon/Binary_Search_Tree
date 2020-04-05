require './node.rb'
require './tree.rb'

#1. Create a binary search tree from an array of random numbers 
arr = Array.new(20) { rand(1..100) } 
bst = Tree.new(arr)


#2. Confirm that the tree is balanced by calling `#balanced?`
puts bst.balanced? 

#3. Print out all elements in level, pre, post, and in order
p bst.iterative_level_order
p bst.preorder
p bst.inorder
p bst.postorder 

#4. try to unbalance the tree by adding several numbers > 100
bst.insert(101)
bst.insert(201)
bst.insert(301)
bst.insert(401)
bst.insert(501)
bst.insert(601)
bst.insert(701)
bst.insert(701)
bst.insert(901)

#5. Confirm that the tree is unbalanced by calling `#balanced?`
puts bst.balanced? 

#6. Balance the tree by calling `#rebalance!`
bst.rebalance! 

#7. Confirm that the tree is balanced by calling `#balanced?`
puts bst.balanced? 

#8. Print out all elements in level, pre, post, and in order
p bst.iterative_level_order
p bst.preorder
p bst.inorder
p bst.postorder 