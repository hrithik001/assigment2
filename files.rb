class Files
    def createFolder(folder_name)
        Dir.mkdir(folder_name) 
    end
    def createFile(folder_name, file_name, file_content)
       
        File.open("#{folder_name}/#{file_name}", 'w') do |file|
            file.write(file_content)
        end
    end
    def updateFile(folder_name, file_name, file_content)
        File.open("#{folder_name}/#{file_name}", 'w') do |file|
            file.write(file_content)
        end
    end
    def deleteFile(folder_name, file_name)
        File.delete("#{folder_name}/#{file_name}")
    end
end
files = Files.new
puts "Folder name :  "
folder_name = gets.chomp
files.createFolder(folder_name)
loop do
   
        puts "[1] Create a file :"
        puts "[2] Update a file :"
        puts "[3] Delete a file"
        operation = gets.chomp.to_i
        case operation
            when 1
                puts "Enter File Name: "
                file_name = gets.chomp
                puts "Content the file?"
                content = gets.chomp
                files.createFile(folder_name, file_name, content)
            when 2
                puts "Enter File Name which you want to update : "
                file_name = gets.chomp
                puts "Content for the file "
                file_data = gets.chomp
                files.updateFile(folder_name, file_name, file_data)
            when 3
                puts "Enter File Name you want to delete: "
                file_name = gets.chomp
                files.deleteFile(folder_name, file_name)
            else
                puts "Invalid selection"
        end
    
    puts "Do you want to continue (Y/N)?"
    continue = gets.chomp
    break if continue == 'N' || continue == 'n'
end