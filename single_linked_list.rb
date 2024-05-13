=begin
Write a Program to create a Singly Linked List and perform the following operations on the same:
Add data to the beginning of the list
Add data to the end of end of the list
Add data in the middle of the list - index provided by the user
Reverse the Linked List
You can create your own Linked List and perform these operations. We should display the linked list after each operation

=end

class Node
  attr_accessor :value, :next_node

  def initialize(value)
    @value = value
    @next_node = nil
  end
end

class ListNode
  attr_accessor :head
#   @@list_size=0
  def initialize
    @head = nil
  end

  def add_at_last(value)
    new_node = Node.new(value)
    current = @head

    if current.nil?  # Handle empty list
      @head = new_node
    #   list_size+=1
      return
    end

    while current.next_node
      current = current.next_node
    end
    current.next_node = new_node
    
    # list_size+=1
  end

  def add_at_front(value)
    new_node = Node.new(value)
    new_node.next_node = @head
    @head = new_node
    
    # list_size+=1
  end

  def insert_at_pos(index,value)
    if index <= 0 || index > size()
       puts "can't insert at #{index} position , kindly enter index  betwwen #{size}"
        return
    end


    if index == 1 || index-1 > size
        add_at_front(value)
        return
    end
    if index-1 == size
        add_at_last(value)     
        return   
    end   
    current = @head

    new_head_pointer = nil

    if size < index 
        return "Size is large"
    end

    i = 0
    while current.next_node != nil && i < index-1
        current = current.next_node
        i+=1
    end

    new_head_pointer = current.next_node

    new_node = Node.new(value)

    current.next_node = new_node

    new_node.next_node = new_head_pointer
    

  end

  def print_list
    current = @head
    while current
      print "#{current.value} => "
      current = current.next_node
    end
      puts "nil"  # Indicate the end of the list
  end

  def size
    count = 0
    current = @head
    while current
      count += 1
      current = current.next_node
    end
    count
  end

  def reverse_list
   
     prev = nil
     current = @head
    while current do
        temp = current.next_node
        current.next_node = prev
        prev = current
        current = temp
    end

    return prev
        
  end 
end

list_head = ListNode.new


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
            list_head.add_at_front(num)
            puts "Successfully added"
            list_head.print_list
         when 2 
            puts "Enter a number to add at end of linked list"
            num = gets.chomp.to_i
            list_head.add_at_last(num)
            puts "Successfully added"
            list_head.print_list
         when 3
            puts "Enter a index along with value to add into list"
            index,num = gets.chomp.to_i,gets.chomp.to_i
            list_head.insert_at_pos(index,num)
            list_head.print_list
         when 4 
            reversed_list = list_head.reverse_list
            # reversed_list = list_head.print_list
            while reversed_list
                print "#{reversed_list.value} => "
               
                reversed_list = reversed_list.next_node
            end
             puts
        
        
    end 
end




# list_head.print_list