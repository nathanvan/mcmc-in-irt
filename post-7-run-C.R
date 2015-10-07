## Load the necessary code from this and previous posts
source("http://edustatistics.org/mcmcinirt/setup/post-7.R")

## Set the seed to keep results reproducible 
set.seed(314159)

## Run the sampler with overdispersed theta.abl,
## a.disc, and b.diff values. Keep sig2.theta
## at its true value.
run.C <- run.chain.2pl(
    ## No burnin, keep 1000 iterations, do not thin
    M.burnin = 0, M.keep  = 1000, M.thin = 1,
    ## Use the fake data simulated in Post #2
    U.data  = U,
    ## Pass in the hyperpriors from Post #1
    hyperpars = hyperpars,
    ##
    ## Generate starting values uniformly from -5 to 5
    th.init = runif( length(theta.abl), 
                     min=-5, max=5     ),
    ##
    ## Generate starting values uniformly from 1/3 to 3
    a.init  = runif( length(a.disc), 
                     min=1/3, max=3 ),
    ##
    ## Generate starting values uniformly from -5 to 5    
    b.init  = runif( length(b.diff), 
                     min=-5, max=5  ),
    ##
    ## Set the starting value to the truth from Post #2    
    s2.init = sig2.theta,
    ##
    ## Set proposal variances.
    ## ( I will explain how to do this in Post 9.
    ##   For now, just use these values. )
    MH.th=.85, MH.a=.15, MH.b=.15, verbose=TRUE)
## 
## Average acceptance rates: 
##  theta.abl: 0.525 
##  a.disc:    0.341 
##  b.diff:    0.456 