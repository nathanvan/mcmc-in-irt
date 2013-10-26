########################
##     WARNING        ##
## This takes awhile. ##
## ################## ##
set.seed( 314159 )
run.100.thinned <- run.chain.2pl(
  ## Note that M.thin = 100
  M.burnin = 0, M.keep  = 1000, M.thin = 100,
  U.data  = U, hyperpars = hyperpars,
     th.init = inits$th, a.init  = inits$a,
     b.init  = inits$b,  s2.init = inits$s2,
     MH.th=1, MH.a=1/5, MH.b=1/2, verbose = TRUE )
## Average acceptance rates: 
##  theta.abl: 0.476 
##  a.disc:    0.262 
##  b.diff:    0.171

## Convert to coda
mcmc.thinned   <-  mcmc(t(run.100.thinned))
