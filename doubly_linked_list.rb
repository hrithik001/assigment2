=begin
Write a Program to create a Doubly Linked List and perform the following operations on the same:
Add data to the beginning of the list
Add data to the end of end of the list
Add data in the middle of the list - index provided by the user
Reverse the Linked List
You can create your own Linked List and perform these operations. We should display the linked list after each operation

=end

class Node
    attr_accessor :val,:prev_node,:next_node

    def initialize(value)
        @val = value
        @prev_node = nil
        @next_node = nil
    end 

end

class DoublyListNode
    attr_accessor :head
    def initialize
        @head = nil
    end

    def addNodeAtBegin(value)
        if @head.nil?
            new_node = Node.new(value)
            @head = new_node
            return
        end

        new_node = Node.new(value)
        new_node.next_node = @head
        @head.prev_node = new_node
        @head = new_node
    end

    def addNodeAtEnd(value)
        new_node = Node.new(value)
        current = @head
        if current.nil?  # Handle empty list
             @head = new_node
             return
        end

        while current.next_node
            current = current.next_node
        end
        current.next_node = new_node
        new_node.prev_node = current

    end

    def addNodetIndex(index,value)
      if index >= size || index <= 0 
        puts "List is only #{size} in size, 'Invalid index'"
        return
      end
      
      current = @head
      ind = 1
    
      while ind < index
        current = current.next_node
        ind += 1
      end
      puts "i'm here at #{current.val} in #{index}"

      new_node = Node.new(value)
      new_node.next_node = current.next_node
      current.next_node.prev_node = new_node
      current.next_node = new_node
      new_node.prev_node = current


    end

    def reverseList 
        ans = nil
        current = @head
        while current do
            temp_node = current.next_node
            current.next_node = ans
            if !ans.nil? #handel for the first iteration of loop when ans is nil and not having and previous node
                ans.prev_node = current

            end
            ans=current
            current = temp_node

            
        end
        return ans
    end

    def printList
        current = @head
        while current
            print "#{current.val} => "
            current = current.next_node
        end
        puts
    end
    def size 
        count = 0
        current = @head
        while current
            count += 1
            current = current.next_node
        end
        return count
    end


end

doubly_linked_list = DoublyListNode.new

allowed = true
until !allowed do 
    puts "------MENU-------"
    puts "[0] Exit"
    puts "[1] Add at front"
    puts "[2] Add at last"
    puts "[3] Add at position"
    puts "[4] Reverse the list"
    puts "-----------------"
    
    input = gets.chomp.to_i
    if input == 0
        allowed = false
        break
    end
    case input 
         when 1 
            puts "Enter a number to add at front of linked list"
            num = gets.chomp.to_i
            doubly_linked_list.addNodeAtBegin(num)
            puts "Successfully added"
            doubly_linked_list.printList
         when 2 
            puts "Enter a number to add at end of linked list"
            num = gets.chomp.to_i
            doubly_linked_list.addNodeAtEnd(num)
            puts "Successfully added"
            doubly_linked_list.printList
         when 3
            puts "Enter a index along with value to add into list"
            index,num = gets.chomp.to_i,gets.chomp.to_i
            doubly_linked_list.addNodetIndex(index,num)
            doubly_linked_list.printList
         when 4 
            reversed_list = doubly_linked_list.reverseList
            
            while reversed_list
                print "#{reversed_list.val} => "
               
                reversed_list = reversed_list.next_node
            end
             puts
        
        
    end 
end




# list_head.print_list
