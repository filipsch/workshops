## Clean

movies_clean <- movies

# Step 1
names(movies_clean)[names(movies_clean) == "userRating"] <- "rottenRating"
names(movies_clean)[names(movies_clean) == "userReviews"] <- "rottenVotes"

# Step 2
row_misses_info <-  is.na(movies_clean$imdbVotes) | is.na(movies_clean$rottenVotes) | is.na(movies_clean$imdbRating) | is.na(movies_clean$rottenRating)
summary(row_misses_info)
movies_clean <- movies_clean[!row_misses_info, ]

# Step 3
movies_clean <- movies_clean[movies_clean$imdbVotes > 10000 & movies_clean$rottenVotes > 10000, ]

# Step 4
cols_to_keep <- c("Title", "Year", "Runtime", "imdbRating", "imdbVotes", "rottenRating", "rottenVotes")
movies_clean <- movies_clean[cols_to_keep]


movies_overall <- movies_clean
movies_overall$Votes <- movies_overall$imdbVotes + rottenVotes
movies_overall$Rating <- (movies_overall$imdbVotes * movies_overall$imdbRating + movies_overall$rottenVotes * 2 * movies_overall$rottenRating) / movies_overall$Votes

## Explore

head(movies_overall[order(movies_overall$Rating, decreasing = TRUE), c("Title", "Rating")], 15)
head(movies_overall[order(movies_overall$Rating, decreasing = TRUE), c("Title", "Votes")], 15)

## Visualize

plot(movies_overall$Year, movies_overall$Rating)
hist(movies_overall$Rating, breaks = 25)