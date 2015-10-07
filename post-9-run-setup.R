## Load the necessary code from this and previous posts
source("http://edustatistics.org/mcmcinirt/setup/post-9.R")

## Define the hyper parameters to values from Post 1
hyperpars <- list( mu.a         = 1.185,
                   s2.a         = 1.185,
                   s2.b         = 100,
                   alpha.th     = 1,
                   beta.th      = 1 )

## Put initial values in a list
set.seed( 314159 )
inits <- list(
    ## ... uniformly from -5 to 5
    th = runif( length(theta.abl), min=-5, max=5),
    ## ... uniformly from 1/3 to 3
    a  = runif( length(a.disc), min=1/3, max=3 ),
    ## ... uniformly from -5 to 5
    b  = runif( length(b.diff), min=-5, max=5 ),
    ## .. uniformly from 0 to 5
    s2 = runif( 1, min=0, max=5) )
