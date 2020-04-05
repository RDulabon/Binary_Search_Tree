class Tree 
  attr_accessor :root 

  def initialize(arr) 
    arr.sort!.uniq! 
    @root = build_tree(arr) 
  end   

  def build_tree(arr) 
    if arr.empty?
      nil
    elsif arr.length < 2
      root = Node.new(arr[0]) 
    else 
      root = Node.new(arr[arr.length/2]) 
      root.left_child = build_tree(arr[0..(arr.length/2)-1])
      root.right_child = build_tree(arr[(arr.length/2)+1..-1]) 
    end 
    root 
  end

  def insert(value, node=@root) 
    if value == node
      node
    elsif node > value
      node.left_child ? insert(value, node.left_child) : node.left_child = Node.new(value)
    else
      node.right_child ? insert(value, node.right_child) : node.right_child = Node.new(value)
    end  
  end 

  def delete(value)
    node = find(value)
    parent = find_parent(value) 
    if node.left_child == nil && node.right_child == nil 
      parent.left_child == node ? parent.left_child = nil : parent.right_child = nil
    elsif node.left_child != nil && node.right_child != nil
      replacement = find_min(node.right_child) 
      parent_replacement = find_parent(replacement) 
      parent.right_child = replacement
      replacement.left_child = node.left_child
      replacement.right_child = node.right_child 
      parent_replacement.left_child = nil 
    else 
      if parent.left_child == node
        node.left_child ? parent.left_child = node.left_child : parent.left_child = node.right_child
      else
        node.left_child ? parent.right_child = node.left_child : parent.right_child = node.right_child
      end 
    end 
  end

  def find(value, node=@root)
    if value == node
      node
    elsif node > value
      node.left_child ? find(value, node.left_child) : false
    else node < value 
      node.right_child ? find(value, node.right_child) : false 
    end
  end

  def find_parent(value, node=@root)
    if node.left_child == value || node.right_child == value
      node
    elsif node.left_child > value
      find_parent(value, node.left_child)
    else
      find_parent(value, node.right_child)
    end 
  end 

  def find_min(node=@root)
    node.left_child ? find_min(node.left_child) : node 
  end 

  def iterative_level_order
    queue = [@root]
    level_order = []
    until queue.empty?
      node = queue.shift
      block_given? ? yield(node) : level_order << node.value 
      queue << node.left_child if node.left_child
      queue << node.right_child if node.right_child
    end
    level_order unless block_given? 
  end

#Preorder Traversal: Root, Left Tree, Right Tree
  def preorder(node=@root, preorder_arr=[]) 
    if node == nil
      preorder_arr
    else 
      block_given? ? yield(node) : preorder_arr << node.value 
      preorder(node.left_child, preorder_arr)
      preorder(node.right_child, preorder_arr) 
    end 
  end

#Inorder Traversal: Left Tree, Root, Right Tree
  def inorder(node=@root, inorder_arr=[])
    if node == nil
      inorder_arr
    else 
      inorder(node.left_child, inorder_arr)
      block_given? ? yield(node) : inorder_arr << node.value 
      inorder(node.right_child, inorder_arr) 
    end 
  end 

#Postorder Traversal: Left Tree, Right Tree, Root
  def postorder(node=@root, postorder_arr=[])
    if node == nil
      postorder_arr
    else 
      postorder(node.left_child, postorder_arr)
      postorder(node.right_child, postorder_arr) 
      block_given? ? yield(node) : postorder_arr << node.value 
    end 
  end 

  def depth(value, node=@root, level=0) 
    if value == node
      level
    elsif node > value
      level += 1
      depth(value, node.left_child, level)
    else node < value 
      level += 1 
      depth(value, node.right_child, level) 
    end
  end 

  def depth_below(node=@root) 
    return 0 if node == nil
    left = depth_below(node.left_child)
    right = depth_below(node.right_child)

    left > right ? left+1 : right+1
  end 

  def balanced?
    (depth_below(root.left_child) - depth_below(root.right_child)).abs <= 1
  end

  def rebalance!
    @root = build_tree(iterative_level_order.sort) 
  end
end