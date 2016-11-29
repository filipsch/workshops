# Convert intro.Rmd to PDF
tit=workshop

# Zip all files
zip -r $tit.zip introduction.Rmd introduction.html intro_r cs_movies intro_python cs_calhousing

# Put files on S3
aws s3 cp --acl public-read $tit.zip s3://documents.datacamp.com/

# clean up local zip
rm $tit.zip
