if (interactive()) {
  con <- stdin()
} else {
  con <- "stdin"
}

# Inital function to find out who goes first
# While loop to make sure user input is acceptable
terminal_output <- cat("X or O? ")
symbol <- toupper(readLines(con = con, n = 1))
# Vector that has the only acceptable answers
available.symbs <- c("X", "O")
while (!(symbol %in% available.symbs)) {
  cat('That is not an acceptable input. You can enter X or O.\nPlease try again.\n')
  terminal_output <- cat("X or O? ")
  symbol <- toupper(readLines(con = con, n = 1))
}

# set player icon
player <- symbol

# order keeper
order.turn <- c("X","O")

# set computer
if (player == "X"){
  cat('The player will go first!\n')
  Sys.sleep(1)
  computer <- "O"
} else {
  cat("The computer will go first!\n")
  Sys.sleep(1)
  computer <- "X"
  selection <- sample(c(1,2,3),2,replace=TRUE)
}

# init the game board of a 3x3 matrix
gameboard <- matrix(data='.', nrow=3,ncol=3)
# Init round counter
round.n <- 1
###### Functions

# Make a guess for the computer. Check to see if the spot is open.
computer.selection <- function(board,round) {
    # Randomly select 2 numbers from 1 to 3
    selection.comp <- sample(c(1,2,3),2,replace=TRUE)
    # Make sure the spot is "." and not already selected
    while (board[selection.comp[1],selection.comp[2]] != '.'){
      # Randomly select 2 numbers from 1 to 3
      selection.comp <- sample(c(1,2,3),2,replace=TRUE)
    }
  # assign the computer sybmol to the picked spot
  board[selection.comp[1],selection.comp[2]] <- computer
  # Increment the round number
  round <- round + 1
  # results
  cat(sprintf("\nThe computer has chosen\nRow:%i\nCol:%i\n\n",selection.comp[1],
              selection.comp[2]))
  Sys.sleep(1)
  print(board)
  Sys.sleep(1)
  computer.out <- list(d1=board, d2=round)
  return(computer.out)
}



# function to print the round number and then board
new.round <- function(number, board) {
  cat("##############################\n")
  cat(sprintf("           Round %i\n",number))
  cat("##############################\n\n")
  Sys.sleep(1)
  #print(board)
  #Sys.sleep(1)
}

# This function takes in the board and checks to see if there is a winning
# combination through all of the rows and columns and then diagonals
check_board <- function(board, outcome) {
  # vector to hold sums
  X_total <- rep(0, 8)
  O_total <- rep(0, 8)
  # count that will be used to assign values to the holding sum vectors
  count <- 1
  # Loop through the rows and columns 1 to 3
  for (i in 1:3) {
    # Grepl the columns and check the amount of each sum
    col.total_x <- sum(grepl("X",board[,i]))
    col.total_o <- sum(grepl("O",board[,i]))
    # Grepl the rows and check the amount of each sum
    row.total_x <- sum(grepl("X",board[i,]))
    row.total_o <- sum(grepl("O",board[i,]))
    # Assign the cols to the holding sum vectors
    X_total[count] <- col.total_x
    O_total[count] <- col.total_o
    # Increment the count
    count <- count + 1
    # Assign the rows to the holding sum vectors
    X_total[count] <- row.total_x
    O_total[count] <- row.total_o
    # Increment the count
    count <- count + 1
  }
  # Grab the diagonals and their totals and add them to the holding sum vectors
  X_total[7] <- sum(grepl("X", c(board[1,1],board[2,2],board[3,3])))
  X_total[8] <- sum(grepl("X", c(board[3,1],board[2,2],board[1,3])))
  O_total[7] <- sum(grepl("O", c(board[1,1],board[2,2],board[3,3])))
  O_total[8] <- sum(grepl("O", c(board[3,1],board[2,2],board[1,3])))

  # If statements to check to see if anyone won the game or not
  if (sum(grepl(3, X_total)) == 1){
    cat("##############################\n")
    cat("      X Has won the Game!\n")
    cat("##############################\n")
    outcome <- FALSE 
  } else if (sum(grepl(3, O_total)) == 1) {
    cat("##############################\n")
    cat("      O Has won the Game!\n")
    cat("##############################\n")
    outcome <- FALSE 
  }
return(outcome)
}




####### Game logic
result <- TRUE
open.space <- TRUE

# Begin game and keep playing as long as the there are open spaces and any three way combos
while (result && open.space) {

  # Game Logic for if it is the player's turn
  if (order.turn[1] == player) {

    # Print the new round display
    new.round(round.n, gameboard)
    
    # init entry
    entry.taken <- TRUE
    # Check to see that the entry wasn't already taken
    while (entry.taken){

        # Make sure they put in a correct row number
        cat("What Row [1, 2, 3]?\n")
        row.num <- as.integer(readLines(con = con, n=1))
        # check to see if the entry is allowed
        test <- row.num %in% c(1,2,3)

        # Check to see if the row.num is within the allowed variables
        while (test != TRUE) {
          # If the number isn't correct then repeat everything, but give a warning
          cat("I'm sorry but you can only put 1, 2, or 3\n")
          cat("What Row [1, 2, 3]?\n")
          row.num <- as.integer(readLines(con = con, n=1))
          # check to see if the entry is allowed
          test <- row.num %in% c(1,2,3)
      } # End of while row.num check while loop

      # Make sure they put in a correct column number
      cat("What Column [1, 2, 3]?\n")
      col.num <- as.integer(readLines(con = con, n=1))
      # Check to see if the entry is allowed
      col.test <- col.num %in% c(1,2,3)
      
      # Check to see if the col.num is within the allowed variables
      while (col.test != TRUE) {
        # If the number isn't correct then repeat everything, but give a warning
        cat("I'm sorry but you can only put 1, 2, or 3\n")
        cat("What Column [1, 2, 3]?\n")
        col.num <- as.integer(readLines(con = con, n=1))
        # Check to see if the entry is allowed
        col.test <- col.num %in% c(1,2,3)
      } # End of col.num check while loop

      # Check to see if the matrix space is free or not
      # We need this if statment so we can warn the player that this specific selection is 
      # already taken and cannot be chosen
      if (gameboard[row.num, col.num]!="."){
        cat("You can't pick a space that has already been taken. Please pick another one.\n")
      }else{
      entry.taken <- FALSE
      } # End of if and else statement
    } # End of entry check while loop

    # Put in the player icon at the player's desired location
    gameboard[row.num, col.num] <- player
     #Check to see if the game is over
    result <- check_board(gameboard, result)
    # Change the order of the order vector
    order.turn <- c(order.turn[2], order.turn[1])
    # Increment round
    round.n <- round.n + 1
    # check if there are open spaces on the board
    open.space <- ("." %in% gameboard)


  # This is the logic for if it is the computer's turn 
  } else if (order.turn[1] == computer) {
    # Print new round
    new.round(round.n, gameboard)
    # Have the computer select a spot
    a <- computer.selection(round = round.n, board = gameboard)
    # Add the list values to their corresponding variable names
    gameboard <- a$d1
    round.n <- as.integer(a$d2)

     #Check to see if the game is over
    result <- check_board(gameboard, result)
    # Change the order of the order vector
    order.turn <- c(order.turn[2], order.turn[1])
    open.space <- ("." %in% gameboard)
  }
}

# Last and final condition. We are checking to see if the game board has no free spaces
# and there are no winning three combos. Then we report it is a tie game.
if (result && (open.space == FALSE)) { 
  cat("\nLooks like a tie game! Better luck next time!\n")
}
