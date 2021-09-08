WIN_COMBINATIONS = 
[
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]

def display_board(board) 
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end 

def input_to_index(input)
  x = input.to_i
  index = x - 1 
end 

def move(board, position, char)

  board[position] = char
  board
end 

def position_taken?(board,index)
  if (board[index] == " ") || (board[index] == "") || (board[index] == nil)
    false
    elsif (board[index] == "X") || (board[index] == "O")
      true
    end
end 

def valid_move?(board, index)
  if (index < 0) || (index > 8) || (position_taken?(board,index) == true)
    false
  else 
    true 
  end 
end
    

def turn_count(board)
  count = 0
  board.each do |x|
    if x != " "
      count += 1 
    end 
  end
  count 
end 
    
def current_player(board)
  if turn_count(board) % 2 == 0
    return "X"
  else 
    return "O"
  end 
end    
    
def turn(board)
  puts "Please enter 1-9:"
  input = gets.chomp
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index, current_player(board))
  else 
    turn(board)
  end
  display_board(board)
end 


def won?(board)
  WIN_COMBINATIONS.each do |x|
    win_index1 = x[0]
    win_index2 = x[1]
    win_index3 = x[2]
            
    position1 = board[win_index1]
    position2 = board[win_index2]
    position3 = board[win_index3]
    positions = [position1, position2, position3]
    if position1 == position2 && position2 == position3 && position_taken?(board, win_index1)
      return x
    end 
  end
  false
end

            
def full?(board)
  if board.include?(" ")
    return false
  else true 
  end 
end 

def draw?(board)
  if won?(board) == false && full?(board) == true
    return true
  else
    return false
  end
end
            
def over?(board)
  if won?(board) || draw?(board) || full?(board)
    true
  end
end 
            
            
def winner(board)
  if won?(board)
    return board[won?(board)[0]]
  end
end 

def play(board)
  puts "Welcome to Tic Tac Toe!"
  display_board(board)
 until over?(board) == true do
   turn(board)
 end
 if won?(board) != false
   win = winner(board)
   puts "Congratulations #{win}!"
 elsif draw?(board) == true
   puts "Cat's Game!"
 end
end