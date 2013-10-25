## Load the necessary code from this and previous posts
source("http://mcmcinirt.stat.cmu.edu/setup/post-8.R")

## Reset the item sampler to dummy samplers
sample.a <- dummy.cc.sampler
sample.b <- dummy.cc.sampler

set.seed( 314159 )
run.D <- run.chain.2pl(
    M.burnin = 0, M.keep  = 1000, M.thin = 1,
    U.data  = U,
    hyperpars = hyperpars,
    ## Generate starting values uniformly from -5 to 5
    th.init = runif( length(theta.abl), 
                     min=-5, max=5     ),
    ## Keep item parameters at their true values
    a.init  = a.disc,
    b.init  = b.diff,
    ## Generate starting values uniformly from 0 to 5
    s2.init = runif( 1, min=0, max=5),
    ##
    MH.th=1, MH.a=NA, MH.b=NA,
    verbose = TRUE )
## Average acceptance rates: 
##  theta.abl: 0.482 
##  a.disc:    NaN 
##  b.diff:    NaN 

## Convert to coda
run.D.mcmc <- mcmc( t(run.D) )