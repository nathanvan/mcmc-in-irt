## Set the random-number generator seed, 
## to make the results reproducible
set.seed(314159)

## set the number of items I and persons P
I.items    <- 30
P.persons  <- 2000

## set the fixed item and population parameters
a.disc     <- 1 + runif(I.items,-0.5,0.5)
b.diff     <- seq(-3,3,length=I.items)

## generate the person ability parameters
mean.theta <- 0
sig2.theta <- (1.25)^2
theta.abl  <- rnorm(P.persons, mean=mean.theta, 
                    sd=sqrt(sig2.theta))
