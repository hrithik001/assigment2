=begin
Write a Program to Implement Stack with a Linked List and perform the following operations:
Push Data
Pop Data
Peek Data

=end

class Node
    attr_accessor :val,:next_ptr
    def initialize(value)
        @val = value
        @next_ptr = nil
    end

end
class Stack 
    attr_accessor :top_node
    def initialize
        
       @top_node = nil
    end
    def push(value)
        new_node = Node.new(value)
        if isEmpty
            @top_node=new_node
            return
        end
       new_node.next_ptr = @top_node
       @top_node = new_node
    end
    def peek 
        if isEmpty
            puts "Stack is empty"
            return
        end
        puts "#{@top_node.val} is the top element "
    end
    def pop 
        if isEmpty
            puts "Stack is Empty"
            return
        end
       popped_node = @top_node
       @top_node = @top_node.next_ptr
       puts "Popped element is #{popped_node.val}"
    end
    def printRecursive(current)
        if(current.nil?)
            puts "-------"
            return
        end
        puts "|  #{current.val}  |"
        printRecursive(current.next_ptr)
    end    
    def printStack
        puts "-----[ STACK VISUALS ]------"
        printRecursive(@top_node)
      
    end

    def isEmpty
         @top_node.nil?
    end
end

stack = Stack.new

allowed = true
while allowed
    puts "-----[ OPERATIONS ]------"
    puts "[1] Exit"
    puts "[2] Push a element"
    puts "[3] Pop a element"
    puts "[4] Peek a element"
    puts "-------------------------"
    input = gets.chomp.to_i
    case input
        when  1
            allowed = false
        when 2
            puts "Enter the element you want to push"
            element = gets.chomp.to_i
            stack.push(element)
            stack.printStack
        when 3
            stack.pop 
        when 4
            stack.peek
    end
end



        



