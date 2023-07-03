board = [
  ["-", "-", "-", "-", "-", "-"],
  ["-", "-", "-", "-", "-", "-"],
  ["-", "-", "-", "-", "-", "-"],
  ["-", "-", "-", "-", "-", "-"],
  ["-", "-", "-", "-", "-", "-"],
  ["-", "-", "-", "-", "-", "-"],
  ["-", "-", "-", "-", "-", "-"],
]

connect = false
row = board.length
cols = board[0].length

# function to display board
def display_board(board)
  index = 0
  7.times do
    puts board[index].join()
    index += 1
  end
end

def victory_row(board)
  # Attempt at checking for horizontal win. The idea is iterating through board, then the row and counting X's. When it hits a "-", count resets.
  count = 0
  for row in board
    for col in row
      if col == "X"
        count += 1
        if count == 4
          puts "You win."
          connect = true
        end
      elsif col == "-"
        count = 0
      end
    end
  end
  return false
end

def victory_col(board)
end

puts "Enter 'board' to display board and play: "
input = gets.chomp

if input == "board"
  display_board(board)
end

turn = 0
while connect == false
  puts "Choose a column to make your move:"
  col = gets.to_i - 1
  row = board.length - 1
  if board[row][col] == "-"
    board[row][col] = "X"
    victory_row(board)
  elsif board[row][col] == "X"
    row -= 1 until board[row][col] == "-"
    board[row][col] = "X"
    connect = false
  end
  display_board(board)
  turn += 1
end
