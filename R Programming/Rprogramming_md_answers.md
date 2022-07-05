**R Script**

1. You used `Repeat` inside `Repeat` structures, which may increase the time complexity. Imagine that you are searching for a pattern within a DNA sequence data, it is not good practice to have big-time complexity. We encourage our trainees, not to nested use `for` loops and `Repeat` functions, if there is a way not to. 

Additionally, You can use `apply` functions instead of `for` loops. If you're not familiar with `apply` family, you can the sources below useful.

https://github.com/PowersPope/skill-assessments/blob/main/R%20Programming/tic-tac-toe-powers.R#L145

1A. I have removed the repeat within repeats. In there I have instead replaced the inner repeats with a while loop. to check and see if something has been entered correctly or not. THe main logic I have removed all repeats and instead replaced them with
while loops. I know `apply` funcitons, however, I did not see a use for them within the function that I used the `for` loop within. Here are the examples of while loops I used:

https://github.com/PowersPope/skill-assessments/blob/main/R%20Programming/tic-tac-toe-powers-rework.R#L141
https://github.com/PowersPope/skill-assessments/blob/main/R%20Programming/tic-tac-toe-powers-rework.R#L134
https://github.com/PowersPope/skill-assessments/blob/main/R%20Programming/tic-tac-toe-powers-rework.R#L149
https://github.com/PowersPope/skill-assessments/blob/main/R%20Programming/tic-tac-toe-powers-rework.R#L163

2. Please do not print the board more than necessary. We want to see the board after the computer makes a move. Also, beware that `Repeat` functions that you used may be the reason. Because,the  `Repeat` loop checks the condition at the end of each iteration while, `while` loop checks it at the beginning of each iteration. For example:

```R
v <- c("Hello","loop")
cnt <- 2

repeat {
   print(v)
   cnt <- cnt+1

   if(cnt > 5) {
      break
   }
}

```

The output:

```R
[1] "Hello" "loop" 
[1] "Hello" "loop" 
[1] "Hello" "loop" 
[1] "Hello" "loop"
```
However, if you replace the `Repeat` with `while`:

```R
v <- c("Hello","while loop")
cnt <- 2

while (cnt < 5) {
   print(v)
   cnt = cnt + 1
}
```

The output:
```
[1] "Hello" "while loop" 
[1] "Hello" "while loop" 
[1] "Hello" "while loop" 
```


2A. I made sure to go into all of the repeat functions and either switch them to
while loops. If there is a repeat within a repeat, then I changed the inner repeat
to a while loop statmement. I even changed almost all of the repeat functions into while loops.
I showed where I replaced some repeat functions in the examples in part 1A.

3. Please try to not set such a long time interval for `Sys.sleep()` within the [script](https://github.com/PowersPope/skill-assessments/blob/main/R%20Programming/tic-tac-toe-powers.R#L34). This causes the game to feel sluggish.

3A. I reduced all of the `Sys.sleep()` commands to only 1 second to speed up the 
feel of the game.

4. Please try to avoid defining the same variables over again. You can use recall the variable to use inside the other functions if it's already defined.

https://github.com/PowersPope/skill-assessments/blob/main/R%20Programming/tic-tac-toe-powers.R#L124
https://github.com/PowersPope/skill-assessments/blob/main/R%20Programming/tic-tac-toe-powers.R#L14
https://github.com/PowersPope/skill-assessments/blob/main/R%20Programming/tic-tac-toe-powers.R#L29

4A. I made sure to get rid of all of the variables that appear within a function and in the global environment.
This way I am not redefining a variable over again within a function.


5. When the game finishes, I got this message. Please try to prevent that. Instead of using `NAs` to create empty board, you can try to use `.` to check if you still get the same message.

```R
Warning message:
In as.integer(readLines(con = con, n = 1)) : NAs introduced by coercion
```

5A. I switched the `NAs` to `.`, I do not see any Warning Messages anymore at the end of the game.

6. Additionally, the `if` - `break` structures that you used are not good practice examples.  `if (result == TRUE){` and `if (result){` will give the same result, if the result is defined as `TRUE` or `FALSE` within the game. Generally, when `if` - `break` structures are used at the beginning of a block, they act like preconditions. So it is okay to use them. When they used in the middle of a block of code, they make the code hard to follow. So, you have to be careful.

https://github.com/PowersPope/skill-assessments/blob/main/R%20Programming/tic-tac-toe-powers.R#L56-59

```R
# Check to see if the game is over
result <- check_board(gameboard)
if (result == TRUE){
   break
}
``` 

6A. I got rid of all of the `if` - `break` statements within the code and they are handled by while loops instead.
I have some about two if statements left int he main logic, mostly to just output a certain text to the user. This way
they have more info on what they did wrong or the end of the game.

Kindly ask you to improve the script while considering the suggestions. Afterwards, I also suggest using the `styler` package to improve your code styling.

**Resources**
1. https://ademos.people.uic.edu/Chapter4.html
2. https://statisticsglobe.com/apply-functions-in-r/
3. https://www.guru99.com/r-apply-sapply-tapply.html
4. https://www.tidyverse.org/blog/2017/12/styler-1.0.0/
