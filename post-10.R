##
## http://mcmcinirt.stat.cmu.edu/setup/post-10.R
##
##
## Last update: 7-July-2014 by Nathan VanHoudnos

## Set the required package list
required.packages <- c("coda")

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

cat('Attempting to load required packages...\n')
for (pkg in required.packages) {
  if( pkg %in% rownames(installed.packages()) ) {
      require(pkg, character.only=TRUE)
  } else {
      tmp.msg <- paste('\n The required package "', pkg, '" is not installed on your system. \n', sep="")
      tmp.msg <- paste(tmp.msg, 'Please install it by copying the line below and pasting it\n into your R session: \n\n')
      tmp.msg <- paste(tmp.msg,'   install.packages("',pkg,'")\n\n',sep="")
      stop(tmp.msg)
  } 
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
source.setup( "post-3-get-2pl-params.R")

cat('  ... from Post 4\n')
source.setup( "post-4-function-log-prob.R")
source.setup( "post-4-function-check-sampler-graph.R")

cat('  ... from Post 5\n')
source.setup( "post-5-function-mh-sample.R")
source.setup( "post-5-function-th-abl-cc.R")

cat('  ... from Post 6\n')
source.setup( "post-6-function-generic-normal-proposal.R")

cat('  ... from Post 7\n')
source.setup( "post-7-function-def-all-proposal.R")
source.setup( "post-7-function-a-disc-cc.R")
source.setup( "post-7-function-b-diff-cc.R")
source.setup( "post-7-function-def-all-mh-cc.R")

cat('  ... from Post 8\n')
source.setup( "post-8-function-sample-s2.R")
source.setup( "post-8-function-check-sigma.R")

cat('  ... from Post 9\n')
## Nothing, but don't want to "miss" it in the output 

cat('  ... from Post 10\n')
## Nothing, but don't want to "miss" it in the output 

## Clean up
rm(source.setup, required.packages)

cat("Done.\n")
