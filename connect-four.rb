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
  count = 0
  cols = 0
  while cols < board[0].length
    rows = board.length - 1
    while rows >= 0
      if board[rows][cols] == "X"
        count += 1
      end
      rows -= 1
    end
    cols += 1
  end
end

system "clear"
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
  elsif board[row][col] == "X"
    row -= 1 until board[row][col] == "-"
    board[row][col] = "X"
    connect = false
  end
  victory_col(board)
  victory_row(board)
  display_board(board)
  turn += 1
end
