set.seed( 314159 )
run.E <- run.chain.2pl(
    M.burnin = 0, M.keep  = 1000, M.thin = 1,
    U.data  = U, hyperpars = hyperpars,
    th.init = inits$th, a.init  = inits$a,
    b.init  = inits$b,  s2.init = inits$s2,
    MH.th=1, MH.a=1/5, MH.b=1/2, verbose = TRUE )
## Average acceptance rates: 
##  theta.abl: 0.518 
##  a.disc:    0.235 
##  b.diff:    0.194 

## Convert to coda
run.E.mcmc <- mcmc( t(run.E) )
