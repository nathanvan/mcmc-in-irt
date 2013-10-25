## Load the necessary code from this and previous posts
source('http://mcmcinirt.stat.cmu.edu/setup/post-6.R')

## Check that we have the version from Post 4. 
head(prop.th.abl)                                                    
## 1 function (state)                                                
## 2 {                                                               
## 3     th.old <- state$th                                          
## 4     MH.th <- state$MH$th                                        
## 5     state$th <- rnorm(length(th.old), mean = th.old, sd = MH.th)
## 6     log.density <- function(state.to, state.from) {   

## Set the seed and run the sampler for ten iterations
set.seed(314159)
run.post4 <- run.chain.2pl(
    M.burnin = 0, M.keep  = 10, M.thin = 1,
    U.data  = U, hyperpars = hyperpars,
    th.init = runif( length(theta.abl), 
                     min=-5, max=5     ),
    a.init  = a.disc, b.init  = b.diff,
    s2.init = sig2.theta,
    MH.th=1, MH.a=NULL, MH.b=NULL)

## Swap in the refactored proposal
prop.th.abl.post4 <- prop.th.abl
prop.th.abl       <- prop.th.abl.refactor

## Set the seed and run the sampler for ten iterations
set.seed(314159)
run.refactor <- run.chain.2pl(
    M.burnin = 0, M.keep  = 10, M.thin = 1,
    U.data  = U, hyperpars = hyperpars,
    th.init = runif( length(theta.abl), 
                     min=-5, max=5     ),
    a.init  = a.disc, b.init  = b.diff,
    s2.init = sig2.theta,
    MH.th=1, MH.a=NULL, MH.b=NULL)

## Check that they return the same values
all.equal( run.post4, run.refactor )
## [1] TRUE