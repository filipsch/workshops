# Convert intro.Rmd to PDF
R -e 'library(rmarkdown); render("R2.0_intro.Rmd")'

# Zip all files
zip -r emergent.zip R2.0_intro.Rmd R2.0_intro.pdf cs_movies/movies.Rmd cs_movies/omdb.db cs_movies/rotten_tomatoes.csv cs_libraries/cs_libraries.Rmd

# Put files on S3
s3cmd put --acl-public emergent.zip s3://documents.datacamp.com/emergent/

# clean up local zip
rm emergent.zip