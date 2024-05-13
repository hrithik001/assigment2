=begin

Write a Program to Mirror a Binary Tree

=end

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
       

        if value == 0
            return nil
        end
        if current_node.nil?
            current_node = Node.new(value)
        elsif value < current_node.val
            current_node.left = createTree(current_node.left)
            if current_node.left && current_node.val <= current_node.left.val
                puts "#{current_node.next.val} cannot have  #{current_node.val} as it's left child"
                return nil
            end
        else
            current_node.right = createTree(current_node.right)
            if current_node.right && current_node.val >= current_node.right.val
                puts "#{current_node.val} cannot have #{current_node.right.val} as it's right child"
                return nil
            end
        end
        return current_node
    end
    def inorder(root = @head)
        if !root.nil?
            inorder(root.left)
            print "#{root.val} "
            inorder(root.right)
        end
    end
    def postOrder(root = @head)
        if !root.nil?
            postOrder(root.left)
            postOrder(root.right)
            print "#{root.val} "
        end
    end
    def preOrder(root = @head)
        if !root.nil?
            print "#{root.val} "
            preOrder(root.left)
            preOrder(root.right)
        end

    end

end

tree = Tree.new
puts "Enter the value "
tree.head = tree.createTree

puts "\nIn order traversal :"
tree.inorder
puts "\nPre Order traversal :"
tree.preOrder
puts "\nPost Order Traversal :"
tree.postOrder
