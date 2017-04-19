## ------------------------------------------------------------------------
score <- 12
course <- "algebra"
passed <- TRUE
ls()

## ------------------------------------------------------------------------
# creation
scores <- c(12, 17, 19, 9)
scores

# single type!
c("algebra", 12) # coercion

# subsetting by index
scores[2]

# naming
scores <- c(algebra = 12, physics = 17, management = 19, religion = 9)
scores

# subsetting by name
scores["physics"]

# Element-wise calculations
other_scores <- c(10, 18, 18, 14)
scores - other_scores

# Q1: what will scores[3] return?
# Q2: what will scores[-1] return?
# Q3: What will other_scores / 2 return?

## ------------------------------------------------------------------------
summ <- list("algebra", 12, TRUE, "physics", 17, TRUE, "management", 19, TRUE, "religion", 9, FALSE)
summ
str(summ)

# lists in lists
summ2 <- list(list("algebra", 12, TRUE), 
              list("physics", 17, TRUE), 
              list("management", 19, TRUE), 
              list("religion", 9, FALSE))
str(summ2)

# named lists in lists
summ3 <- list(list(course = "algebra", score = 12, passed = TRUE),
              list(course = "physics", score = 17, passed = TRUE),
              list(course = "management", score = 19, passed = TRUE),
              list(course = "relgion", score = 9, passed = FALSE))
str(summ3)

# subsetting
str(summ3[[1]])
summ3[[1]][[1]]
summ3[[1]]$course
summ3[[3]][[2]]
summ3[[3]][["score"]]

# Q1: how to get 'management'?
# Q2: how to get the score for physics?
# Q3: What's the difference between summ3[1] and summ3[[1]]?

## ------------------------------------------------------------------------
options(stringsAsFactors = FALSE)

# 3 same-length vectors
courses <- c("algebra", "physics", "management", "religion")
scores <- c(12, 17, 19, 9)
passed <- c(TRUE, TRUE, TRUE, FALSE)

# Combine vectors into dataframe
results <- data.frame(courses, scores, passed)
results

# Subsetting
results[2, 1] # 2nd row, 1st column
results[2, ] # entire 2nd row
results[, 1] # entire 1st column
results$courses

# Behind the scenes, data frame is a list!
str(results)

# Q1: How to get all the passed column, as a vector?
# Q2: How to get all the passed column, as a single-column data frame?

## ------------------------------------------------------------------------
# What is your average score?
results
results$scores

# mean is a base R function
mean(results$scores)

my_mean <- function(a, b) {
  ( a + b ) / 2
}

my_mean(5, 2)

## ------------------------------------------------------------------------
# Change FALSE to TRUE to run
if (FALSE) {
  datatable(results) # function the DT package
  install.packages("DT")
}

library(DT)
datatable(results)

## ------------------------------------------------------------------------
temp_celsius <- 68
if(temp_celsius <= 0) {
  print("Brrrr!")
} else {
  print("It's not freezing.")
}

color <- "red"
if(color == "green") {
  print("You love nature!")
} else if(color == "red") {
  print("You like campfires!")
} else {
  print("I can't really tell what you like..")
}

for(i in 1:5) {
  print(i)
}

hobbies <- c("cycling", "movies", "data science")
for(h in hobbies) {
  print(h)
}

