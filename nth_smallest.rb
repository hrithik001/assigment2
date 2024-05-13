=begin
Write a Program to find the Nth smallest element in a Binary Search Tree. Eg: Given n = 7, the output should be the 7th smallest element in the BST. We should throw an error if the tree does not have as many nodes as specified
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

  # Recursive function to find the Nth smallest element in the BST
  def checkInTree(current ,position_ans)
      if current.nil?
        return
      end
      checkInTree(current.left,position_ans)
      position_ans[:k] -= 1
      if position_ans[:k] == 0 # if kth is 0 , that means it found its kth element
        
        position_ans[:ans] = current.value
        return
      end
      
      checkInTree(current.right,position_ans)
  end
  def findNthSmallestElement(n)
   
    position_ans = { k: n , ans: nil} 
    checkInTree(@root,position_ans)
    position_ans[:ans]


    
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


end

# Example usage
tree = Tree.new
tree.createTree
puts "Inorder Traversal of tree"
tree.inorder
puts "\nEnter the Kth number "
n = gets.chomp.to_i

nth_smallest = tree.findNthSmallestElement(n)

puts "answer is #{nth_smallest}"
if nth_smallest.nil?
  puts "Error: Tree does not have at least #{n} nodes."
else
  puts "The #{n}th smallest element is: #{nth_smallest}"
end

