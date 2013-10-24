## Load the necessary code from this and previous posts
source("http://mcmcinirt.stat.cmu.edu/setup/post-4.R")

## Set the seed to keep results reproducible 
set.seed(314159)

## Run the sampler with overdispersed theta.abl
## values and the true, simulated values for the other
## parameters. 
run.B <- run.chain.2pl(
    ## No burnin, keep 1000 iterations, do not thin
    M.burnin = 0, M.keep  = 1000, M.thin = 1,
    ## Use the fake data simulated in Post #2
    U.data  = U,
    ## Pass in the hyperpriors from Post #1
    hyperpars = hyperpars,
    ## Generate starting values uniformly from -5 to 5
    th.init = runif( length(theta.abl), 
                     min=-5, max=5     ),
    ## Set the other parameters to their true values 
    ## from Post #2
    a.init  = a.disc,
    b.init  = b.diff,
    s2.init = sig2.theta,
    ## Set the person ability proposal variance to 1, 
    ## the others to NULL
    MH.th=1, MH.a=NULL, MH.b=NULL,
    ## Output the acceptance rates
    verbose=TRUE)
## [1] 100
## [1] 200
## ... snip ... 
## [1] 1000
## Average acceptance rates: 
##  theta.abl: 0.481 
##  a.disc:    NaN 
##  b.diff:    NaN

## Convert to coda
run.B.mcmc <- mcmc( t(run.B) )
