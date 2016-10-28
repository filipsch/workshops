# Convert intro.Rmd to PDF
tit=emergent_data_4_good

# Zip all files
zip -r $tit.zip intro.Rmd intro.html r_language.Rmd cs_maps/* cs_bank/* -x cs_maps/phantomjs

# Put files on S3
aws s3 cp --acl public-read $tit.zip s3://documents.datacamp.com/

# clean up local zip
rm $tit.zip
