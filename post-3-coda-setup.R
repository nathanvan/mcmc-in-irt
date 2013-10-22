require(coda)
## If the above command fails, you must install the 
## coda library. To do so, un-comment the install.packages 
## line below, run it, and follow the directions it gives.
##
## install.packages('coda')

## N.B. t(...) takes the transpose of a matrix
run.A.mcmc <- mcmc( t(run.A) )
