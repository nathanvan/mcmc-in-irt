## 
## This is the code from Post 2, necessary to setup Post 3
##

## Generate the data
set.seed(314159)
I.items    <- 30
P.persons  <- 2000
a.disc     <- 1 + runif(I.items,-0.5,0.5)
b.diff     <- seq(-3,3,length=I.items)
mean.theta <- 0
sig2.theta <- (1.25)^2
theta.abl  <- rnorm(P.persons, mean=mean.theta, sd=sqrt(sig2.theta))
term.1     <- outer(theta.abl, a.disc)
term.2     <- matrix(rep(a.disc*b.diff, P.persons), nrow=P.persons, 
                byrow=TRUE)
P.prob     <- plogis(term.1-term.2)  ### 1/(1 + exp(term.2 - term.1))
U          <- ifelse(runif(I.items*P.persons)<P.prob,1,0)


## Setup the equating functions 

## The Cook and Eignor (1992) method to equate *this* discrimination 
## parameter with *that* discrimination parameter. 
equate.2pl.a.disc <- function( this.a, this.b, that.a, that.b ) {
  ## N.B. that.a is not used, but is included in the function
  ##             signature for ease of use. 
  return( this.a * sd( this.b ) / sd( that.b ) )
}

## The Cook and Eignor (1992) method to equate *this* difficulty
## parameter with *that* difficulty parameter.
equate.2pl.b.diff <- function( this.a, this.b, that.a, that.b ) {
  ## N.B. this.a and that.a are not used, but are included in
  ##                        the function signature for ease of use.     
  return( (this.b-mean(this.b))*sd(that.b)/sd(this.b)+mean(that.b) )
}

