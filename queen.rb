def is_valid_position(row, col, board, n)
  r = row
  c = col

  # Check diagonally upwards (left and right)
  while (row >= 0) && (col >= 0)
    if board[row][col] == 1
      return false
    end
    row -= 1
    col -= 1
  end

  # Reset row and col for checking diagonally downwards (left and right)
  row = r
  col = c

  while row >= 0
    if board[row][col] == 1
      return false
    end
    row -= 1
    # col -= 1
  end

  # Check for queens in the same column above the current position
  row = r
  col -= 1
  while col >= 0
    if col >= 0 && board[row][col] == 1
      return false
    end
    col -= 1
  end

  return true
end

def get_queen_positions(row, board, position_arr, n, all_solutions)
  if row == n
    # Add a copy of the current solution to all_solutions
   
    if position_arr.size == 4
        # puts "Solution found! #{position_arr}"
         all_solutions << position_arr.dup
    end
    return
  end

  col = 0
  while col < n
    if is_valid_position(row, col, board, n) == true
      board[row][col] = 1  # Mark the position as occupied
      position_arr.push([row, col])  # Add position to solution array

      get_queen_positions(row + 1, board, position_arr, n, all_solutions)

      # Backtrack: remove the position and unmark the cell
      position_arr.pop
      board[row][col] = 0
    end
    col += 1
  end
end

puts "Enter the N x N matrix size for chess board (Minimum value: 4)"
n = gets.to_i

if n < 4
  puts "Invalid Input! Minimum Value is 4."
  exit
end

board = Array.new(n) { Array.new(n, 0) }
position_arr = []
all_solutions = []
row = 0
while row < n 
    get_queen_positions(row, board, position_arr, n, all_solutions)
    row += 1
end

if all_solutions.empty?
  puts "No solutions found for N-Queens problem with N=#{n}"
else
  puts "All possible solutions for N-Queens problem with N=#{n}:"
    all_solutions.each do | board_data |
        print "#{board_data} \n"
    end
        
end
