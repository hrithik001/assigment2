=begin
Write a Program to Implement Queue with an Array and perform the following operations:
Enqueue Data
Dequeue Data
Show Data
=end

class Queue
    attr_accessor :queue,:front,:back
    MAX_SIZE = 200
    def initialize
        @queue = [200]
        @front = 0
        @back = 0
    end

   def enqueue(value)
        if @back == MAX_SIZE 
            puts "Queue is Full"
            return
        end
        @queue[@back]=value
        @back += 1
   end
   def dequeue 
    if @front == @back
        puts "Queue is Empty"
        return 
    end
    val = queue[@front]
    index = 0
    while index < @back-1 
        queue[index]=queue[index+1]
        index += 1
    end
    @back -= 1

    puts "#{val} is removed from Queue"
    
   end 
   def printQueue
    if @front == @back
        puts "Queue is Empty"
        return 
     end
     index = @front
     print "[ "
     while index < @back do
        print " #{@queue[index]} |"
        index += 1
     end
     print " ]"
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




