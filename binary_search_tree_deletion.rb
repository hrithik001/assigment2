=begin
Write a Program to delete a specific node in a Binary Search Tree. Once deleted, please re-balance the tree if the need arises
=end

class Node
  attr_accessor :value, :left, :right

  def initialize(value)
    @value = value
    @left = nil
    @right = nil
  end
end

class Tree
  attr_accessor :root

  def initialize
    @root = nil
  end

  # Recursive function to insert a node into the BST
  def insert(value)
    if @root.nil?
      @root = Node.new(value)
    else
      addNode(@root, value)
    end
  end

  def addNode(current_node, value)
    if value < current_node.value
      # Insert to the left subtree if the value is less than the current node
      if current_node.left.nil?
        current_node.left = Node.new(value)
      else
        addNode(current_node.left, value)
      end
    else
      # Insert to the right subtree if the value is greater than or equal to the current node
      if current_node.right.nil?
        current_node.right = Node.new(value)
      else
        addNode(current_node.right, value)
      end
    end
  end

 
  def inorder(current = @root)
    if current.nil?
        return
    end

    inorder(current.left)
    print "#{current.value} "
    inorder(current.right)
    end

  # Method to create a BST by taking user input for node values
  def createTree
   
    loop do
        puts "Enter node values [ 0 for exit ]"
      value = gets.chomp.to_i
      break if value == 0
      insert(value)
    end
  end
  
  def deleteNode(current = @root ,key)
     if !current.nil?
        if key < current.value 
            current.left = deleteNode(current.left,key)
        elsif key > current.value
            current.right = deleteNode(current.right,key)
        else
            if !current.left.nil? && !current.right.nil? #node not having any child
                return nil
            end
            if !current.left.nil? || !current.right.nil? #node having only one child (left or right)
                return current.left.nil? ? current.right : current.left
            end
            # node with two child
            temp_tree = current.left
            while temp_tree.right?
                temp_tree=temp_tree.right
            end
            current.value = temp_tree.value
            current.left = deleteNode(current.left,temp_tree.value)
        end
    end
  end


end

# Example usage
tree = Tree.new
tree.createTree
puts "Inorder Traversal of tree"
tree.inorder
loop do
    puts "\n Do you want to delete any element : [Y/n]"
    val = gets.chomp
    break if val == 'n' || val == 'N'
    puts "Enter the value to be deleted:"
    key = gets.chomp.to_i
    tree.deleteNode(key)
    puts "Inorder After deletion"
    puts tree.inorder
    
end


