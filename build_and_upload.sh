# Convert intro.Rmd to PDF
tit=sagioworkshop

R -e 'rmarkdown::render("introduction.Rmd")'
R -e 'rmarkdown::render(input = "intro_r/r_language.Rmd"); knitr::purl(input = "intro_r/r_language.Rmd", output = "intro_r/r_language.R")'
R -e 'rmarkdown::render(input = "cs_bank/cs_bank.Rmd")'
R -e 'rmarkdown::render(input = "cs_movies/cs_movies.Rmd")'

# Zip all files
zip -r $tit.zip introduction.Rmd introduction.html intro_r cs_movies cs_bank

# Put files on S3
aws s3 cp --acl public-read $tit.zip s3://documents.datacamp.com/

# clean up local zip
rm $tit.zip
