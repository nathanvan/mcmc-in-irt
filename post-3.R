##
## http://mcmcinirt.stat.cmu.edu/setup/post-3.R
##
## This is the code from Post 2, necessary to setup Post 3
##
## Last update: 24-Oct-2013 by Nathan VanHoudnos

## Function to load R code
## ... based off of: 
##        http://stackoverflow.com/a/12195574/419842
source.setup <- function( code.to.run ) {
  url <- paste("http://mcmcinirt.stat.cmu.edu/setup/",
               code.to.run,sep="")
  tryCatch( source(url),
    error=function(cond) {
      message(paste("Error with URL:\n\n   ", url,'\n'))
      message(cond)
      message("\n")
      stop("Stopping script.")
    },
    warning=function(cond) {
      message(paste("Error with URL:\n\n   ", url,'\n'))
      message(cond)
      message("\n")
      stop("Stopping script.")
    })
}


cat('Attempting to load previous R code...\n')
cat('  ... from Post 2\n')
source.setup( "post-2-generate-2pl-data-set-parameters.R" )
source.setup( "post-2-generate-2pl-data-calc-U.R" )
source.setup( "post-2-equate-functions.R" )

cat('  ... from Post 3\n')
source.setup( "post-3-function-blocked-mcmc-update.R")
source.setup( "post-3-mh-gibbs-shell-setup.R" )
source.setup( "post-3-mh-gibbs-shell.R" )
source.setup( "post-3-mh-gibbs-shell-run-A-setup.R" )

## Clean up
rm(source.setup)

cat("Done.\n")
