##
## http://mcmcinirt.stat.cmu.edu/setup/post-4.R
##
##
## Last update: 22-Oct-2013 by Nathan VanHoudnos

## Set the required package list
required.packages <- c("coda")

## Setup a function to run scripts
source.setup <- function( code.to.run ) {
  source(paste("http://mcmcinirt.stat.cmu.edu/setup/",code.to.run,sep=""))
}

cat('Attempting to load required packages...\n')
for (pkg in required.packages) {
  if( pkg %in% rownames(installed.packages()) ) {
      require(pkg, character.only=TRUE)
  } else {
      tmp.msg <- paste('\n The required package "', pkg, '" is not installed on your system. \n', sep="")
      tmp.msg <- paste(tmp.msg, 'Please install it by copying the line below and pasting it\n into your R session: \n\n')
      tmp.msg <- paste(tmp.msg,'   install.pacakges("',pkg,'")\n\n',sep="")
      stop(tmp.msg)
  } 
}

cat('Attempting to load previous R code...\n')
## From Post 2
source.setup( "post-2-generate-2pl-data-set-parameters.R" )
source.setup( "post-2-generate-2pl-data-calc-U.R" )
source.setup( "post-2-equate-functions.R" )

## From Post 3
source.setup( "post-3-mh-gibbs-shell-setup.R" )
source.setup( "post-3-mh-gibbs-shell.R" )
source.setup( "post-3-mh-gibbs-shell-run-A-setup.R" )
source.setup( "post-3-get-2pl-params.R")

## From Post 4
source.setup( "post-4-function-log-prob.R")
source.setup( "post-4-function-sample-th.R")

## Clean up
rm(source.setup)

cat("Done.\n")
