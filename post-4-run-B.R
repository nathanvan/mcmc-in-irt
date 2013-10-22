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
    ## Use the true values from Post #2 for the initial values
    th.init = unif(length(theta.abl))*5,
    a.init  = a.disc,
    b.init  = b.diff,
    s2.init = sig2.theta,
    ## Set the person ability proposal variance to 1, the others to NULL
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
