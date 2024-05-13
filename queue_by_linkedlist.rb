=begin

Write a Program to Implement Queue with a Linked List and perform the following operations:
Enqueue Data
Dequeue Data
Show Data


=end
class Node
  attr_accessor :value, :next_node

  def initialize(value)
    @value = value
    @next_node = nil
  end
end

class Queue
  attr_accessor :head
#   @@list_size=0
  def initialize
    @head = nil
  end

  def enqueue(value)
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

  def dequeue
   if @head.nil?
        puts "Queue is empty"
        return
   end
   temp = @head
   @head = @head.next_node
   puts "#{temp.value} is removed from queue"
  end

  

  def printQueue
    if @head.nil?
        puts "Queue is Empty "
        return
    end
    current = @head
    print "[ "
    while current
      print " #{current.value} | "
      current = current.next_node
    end
   
     # Indicate the end of the list
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


end

queue = Queue.new


allowed = true
until !allowed do 
    puts "\n------MENU-------"
    puts "[0] Exit"
    puts "[1] Enqeue"
    puts "[2] Deqeue"
    puts "[3] Show Data"
    
    puts "-----------------"
    
    input = gets.chomp.to_i
    if input == 0
        allowed = false
        break
    end
    case input 
         when 1 
            puts "Enter a number to Enqeue at Queue"
            num = gets.chomp.to_i
            queue.enqueue(num)
           
            queue.printQueue
         when 2 
           queue.dequeue
         when 3
            queue.printQueue
        
    end 
end




# list_head.print_list