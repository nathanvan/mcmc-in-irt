## Load the necessary code from this and previous posts
source("http://mcmcinirt.stat.cmu.edu/setup/post-10.R")

## Define the hyper parameters to values from Post 1
hyperpars <- list( mu.a         = 1.185,
                   s2.a         = 1.185,
                   s2.b         = 100,
                   alpha.th     = 1,
                   beta.th      = 1 )

## Make a list of initial values the init.chain function 
chain.inits <- list(
   ##
   ## A chain with small values  
   chain1 = init.chain( 1, P.persons, I.items,
              theta.mean = -10    , theta.sd = 1,
              a.scale    =   0.001,
              b.mean     =  -10    , b.sd     = 1,
              s2.init    =   0.75 ),
   ##
   ## A chain near the true values
   chain2 = init.chain( 1, P.persons, I.items,
              theta.mean = 0  , theta.sd = 1,
              a.scale    = 0.1,
              b.mean     = 0  , b.sd     = 1,
              s2.init    = 1 ),
   ## 
   ## A chain with large values 
   chain3 = init.chain( 1, P.persons, I.items,
              theta.mean =  10 , theta.sd = 1,
              a.scale    =   1 ,
              b.mean     =  10 , b.sd    = 1,
              s2.init    =   3 )
    )

## Define the random seeds 
seq.of.random.seeds <- c(0, 1, 2) + 314159 

run.par <- run.chain.2pl.list(
    seq.of.random.seeds, chain.inits, 
    M.burnin=0, M.keep=100, M.thin=1,
    U.data=U, hyperpars=hyperpars,
    MH.th.list = list( 1,     1, 1   ),
    MH.a.list  = list( 1/5, 1/5, 1/5 ),
    MH.b.list  = list( 1/2, 1/2, 1/2 ), verbose=TRUE)
## [1] "Setting the seed to 314159"
## [1] "Setting the seed to 314160"
## [1] "Setting the seed to 314161"
## [1] 100
## Average acceptance rates: 
##  theta.abl: 0.419 
##  a.disc:    0.328 
##  b.diff:    0.184 
## [1] 100
## Average acceptance rates: 
##  theta.abl: 0.66 
##  a.disc:    0.213 
##  b.diff:    0.334 
## [1] 100
## Average acceptance rates: 
##  theta.abl: 0.222 
##  a.disc:    0.488 
##  b.diff:    0.113 