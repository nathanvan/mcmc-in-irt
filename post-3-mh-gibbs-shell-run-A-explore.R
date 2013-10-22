## run.A is a large matrix 
dim(run.A)
## [1] 2061 1000

## We can select a single parameter, by selecting a
## row of the matrix. For example:
run.A['theta.abl 1',]
## selects the row for the first person ability parameter

## However, since there are 1000 columns, even one
## row is too much to print to the screen. Here
## we select columns 1 through 5
run.A['theta.abl 1', 1:5]
## [1] -1.682354 -1.682354 -1.682354 -1.682354 -1.682354 
##
## Which is more manageable. Note, that as expected, they
## are all equal. 

## We can also define a vector of names
first.names <- c('theta.abl 1',
                 'a.disc 1',
                 'b.diff 1',
                 'sig2.theta')
## and use it to look at the output
run.A[first.names, 1:5]
## theta.abl 1 -1.6823542 -1.6823542 -1.6823542 -1.6823542 -1.6823542
## a.disc 1     0.7120615  0.7120615  0.7120615  0.7120615  0.7120615
## b.diff 1    -3.0000000 -3.0000000 -3.0000000 -3.0000000 -3.0000000
## sig2.theta   1.5625000  1.5625000  1.5625000  1.5625000  1.5625000
##
## Note, that as expected each parameter stays constant. 
