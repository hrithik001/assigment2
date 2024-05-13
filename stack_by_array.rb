=begin
Write a Program to Implement Stack with an Array and perform the following operations:
Push Data
Pop Data
Peek Data
=end


class Stack
    attr_accessor :stack
    MAX_SIZE = 100
    @@top_index 
    def initialize
        @stack = [MAX_SIZE]
        @@top_index = -1
    end
    def push(value)
        if @@top_index >= MAX_SIZE
            puts "Stack is full"
            return
        end
        @@top_index += 1
        stack[@@top_index]=value
    end
    def peek
        if isEmpty
            puts "Stack is empty"
            return
        end
        return stack[@@top_index]

    end 
    def pop
        if isEmpty
            puts "Stack is empty"
            return
        end
        value=stack[@@top_index]
        @@top_index -= 1
        return value
    end       
    def printStack
         puts "CURRENT STACK VISUALIZATION"
        if isEmpty
            puts "-----"
            puts "| E |"
            puts "-----"
            return
        end
       
        puts      "-----"
        (@@top_index).downto(0) do |i|
            puts "| #{@stack[i]} |"
            puts     "-----"

        end
        
    end
    def isEmpty
         @@top_index==-1
    end
end

stack = Stack.new


allowed = true
while allowed
    puts "-----------[ OPERATIONS ]--------------"
    puts "|--------------------------------------|"
    puts "| [1] Exit                             |" 
    puts "| [2] Push a element to stack          |"
    puts "| [3] Pop an element from the stack    |"
    puts "| [4] Peek from stack                  |"
    puts "|______________________________________|"
    input = gets.chomp.to_i 
    case input
        when 1 
            allowed = false
        when 2
            puts "Enter number to push:"
            num = gets.chomp.to_i 
            stack.push(num)
            stack.printStack
        when 3
            puts "#{stack.pop} is the popped value form stack"
            stack.printStack

        when 4
            puts "#{stack.peek} is the top element in the stack"
    end   
end





