## Make the tuning run
set.seed( 314159 )
run.tune <- run.chain.2pl(
    M.burnin = 0, M.keep  = 100, M.thin = 1,
    U.data  = U, hyperpars = hyperpars,
    th.init = inits$th, a.init  = inits$a,
    b.init  = inits$b,  s2.init = inits$s2,
##     MH.th=1, MH.a=1/3, MH.b=1, verbose = TRUE )
## Average acceptance rates: 
##  theta.abl: 0.551  ## about right, keep MH.th 
##  a.disc:    0.179  ## too low, lower MH.a
##  b.diff:    0.158  ## too low, lower MH.b
##
## Trying again
    MH.th=1, MH.a=1/5, MH.b=1/2, verbose = TRUE )
## Average acceptance rates: 
##  theta.abl: 0.507 ## about right 
##  a.disc:    0.29  ## about right
##  b.diff:    0.23  ## about right