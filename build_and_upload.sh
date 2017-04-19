# Convert intro.Rmd to PDF
tit=sagioworkshop

R -e 'rmarkdown::render("introduction.Rmd")'
R -e 'rmarkdown::render(input = "r_language/r_language.Rmd"); knitr::purl(input = "r_language/r_language.Rmd", output = "r_language/r_language.R")'
R -e 'rmarkdown::render(input = "cs_bank/cs_bank.Rmd")'
R -e 'rmarkdown::render(input = "cs_movies/cs_movies.Rmd")'

# Zip all files
zip -r $tit.zip introduction.Rmd introduction.html r_language cs_movies cs_bank

# Put files on S3
aws s3 cp --acl public-read $tit.zip s3://documents.datacamp.com/

# clean up local zip
rm $tit.zip
