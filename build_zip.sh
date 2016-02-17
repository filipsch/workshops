# Convert intro.Rmd to PDF
R -e 'library(rmarkdown); render("intro.Rmd")'

# Zip all files
zip -r ulyssis.zip zip intro.Rmd intro.pdf r_language.Rmd movies/

# Put files on S3
s3cmd put --acl-public ulyssis.zip s3://documents.datacamp.com/ulyssis/