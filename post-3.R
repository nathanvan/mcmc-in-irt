##
## http://mcmcinirt.stat.cmu.edu/setup/post-3.R
##
## This is the code from Post 2, necessary to setup Post 3
##
## Last update: 19-Oct-2013 by Nathan VanHoudnos

## Setup a function to run scripts
source.setup <- function( code.to.run ) {
  source(paste("http://mcmcinirt.stat.cmu.edu/setup/",code.to.run,sep=""))
}

## Check that the correct packages are loaded


cat('Attempting to load previous R code...\n')
## From Post 2
source.setup( "post-2-generate-2pl-data-set-parameters.R" )
source.setup( "post-2-generate-2pl-data-calc-U.R" )
source.setup( "post-2-equate-functions.R" )

## From Post 3
source.setup( "post-3-mh-gibbs-shell-setup.R" )
source.setup( "post-3-mh-gibbs-shell.R" )
source.setup( "post-3-mh-gibbs-shell-run-A-setup.R" )

## Clean up
rm(source.setup)

cat("Done.\n")
