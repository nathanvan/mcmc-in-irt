## Load the necessary code from this and previous posts
source('http://mcmcinirt.stat.cmu.edu/setup/post-5.R')

## Check that we are using the Post 4
## version of sample.th
head(sample.th)
## 
## 1 function (U.data, old)                        
## 2 {                                             
## 3     th.old <- old$th                          
## 4     MH.th <- old$MH$th                        
## 5     P.persons <- length(th.old)               
## 6     th.star <- rnorm(P.persons, th.old, MH.th)

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

## Swap in the refactored sampler
sample.th.post4 <- sample.th
sample.th       <- sample.th.refactor

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
