# Write a Program to Mirror a Binary Tree


class Node
    attr_accessor :val, :left, :right
    def initialize(value)
        @val = value
        @left = nil
        @right = nil
    end
end

class Tree
    attr_accessor :head
    def initialize
        @head = nil
    end
    def createTree(current_node = nil)
        value = gets.chomp.to_i

        return if value == 0

        current_node = Node.new(value) unless current_node

        puts "Enter the value for left child of #{value} , [ 0 for exit ]"
        current_node.left = createTree(current_node.left)
        puts "Enter the value for right child of #{value}, [0 for exit ]"
        current_node.right = createTree(current_node.right)

        return current_node
    end
    def mirrorTree(current_node = @head)
        return if current_node.nil?

        current_node.left , current_node.right = current_node.right ,current_node.left
        mirrorTree(current_node.left)
        mirrorTree(current_node.right)

    end
    def inorder(current_node = @head)
        return if current_node.nil?
        inorder(current_node.left)
        print "#{current_node.val} "
        inorder(current_node.right)
    end
end

tree = Tree.new
puts "Enter a value for head"
tree.head = tree.createTree
puts "\nInorder Traversing of Tree before Mirroring :"
tree.inorder
puts "\n Inorder Traversing of tree after Mirroring :"
tree.mirrorTree
tree.inorder