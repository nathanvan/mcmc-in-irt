## Initialize vectors to hold the results
## N.B. choose(n,p) calculates the binomial coefficient
##      "n choose p"
theo.2D <- rep(NA, choose(I.items, 2) )
emp.2D  <- theo.2D

## Generate all possible combinations of items
## N.B. combn(x,y) generates all combinations of x
##      taken y at a time. 
cmbn.matrix <- combn(I.items, 2)
## where each column of the matrix is a unique combination
dim(cmbn.matrix)
# [1]   2 435

## We iterate over all unique combinations 
for( which.cmbn in 1:choose(I.items,2) ) {
  ## We define the ii and jj for this combination
  ii <-  cmbn.matrix[1,which.cmbn]
  jj <-  cmbn.matrix[2,which.cmbn]

  ## We calculate Equation 3
  theo.2D[which.cmbn] <- integrate(
               function(th.dummy) {return(
                 1/(1+exp(-a.disc[ii]*(th.dummy-b.diff[ii])))
                 * 1/(1+exp(-a.disc[jj]*(th.dummy-b.diff[jj])))
                 * dnorm(th.dummy,mean.theta, sqrt(sig2.theta))
               )},-Inf, Inf )$value
  
  ## We calculate Equation 4
  emp.2D[which.cmbn] <- mean(U[,ii]*U[,jj])
}
