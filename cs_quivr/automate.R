library(rmarkdown)
setwd("~/courses/r-workshop/quivr")
output_file <- rmarkdown::render("quivr_sql.Rmd")
output_file

# s3cmd tool om lokaal te uploaden naar S3
system(sprintf("s3cmd put --acl-public %s s3://documents.datacamp.com/quivr/", output_file))

# beschikbaar op: https://s3.amazonaws.com/documents.datacamp.com/quivr/quivr_sql.html

# Next step: cronjob!

