# Convert intro.Rmd to PDF
R -e 'library(rmarkdown); render("intro.Rmd")'

# Zip all files
zip -r ulyssis.zip zip intro.Rmd intro.pdf r_language.Rmd movies/movies.Rmd movies/omdb.db movies/rotten_tomatoes.csv

# Put files on S3
s3cmd put --acl-public ulyssis.zip s3://documents.datacamp.com/ulyssis/