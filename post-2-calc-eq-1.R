## 1 Dimensional moments
## Intialize a vector to hold the results
theo.1D <- rep(NA, I.items)

## Loop over each item
for( ii in 1:I.items){
  ## For a given item ii, evaluate Equation 1
  ## N.B. th.dummy   is the integration variable
  ##      a.disc[ii] is the discrimination parameter for item ii
  ##      b.diff[ii] is the difficulty parameter for item ii
  theo.1D[ii] <- integrate(
                   function(th.dummy) {return(
                     1/(1+exp(-a.disc[ii]*(th.dummy-b.diff[ii])))
                     * dnorm(th.dummy,mean.theta, sqrt(sig2.theta)) 
                   )},-Inf, Inf )$value
}
