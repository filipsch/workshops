# Convert intro.Rmd to PDF
tit=aft_workshop

# Zip all files
zip -r $tit.zip intro_r_python.Rmd intro_r_python.html r_language.Rmd example_script.R cs_movies/* cs_bank/*

# Put files on S3
aws s3 cp --acl public-read $tit.zip s3://documents.datacamp.com/

# clean up local zip
rm $tit.zip
