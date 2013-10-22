## Define a complete run of the MH within Gibbs sampler
run.chain.2pl <- function(M.burnin, M.keep, M.thin,
                          U.data, hyperpars, 
                          th.init, a.init, b.init, s2.init, 
                          MH.th, MH.a, MH.b, verbose=FALSE) {
 
  ## Define and initialize the list of things to keep track of in 
  ## the "current state" of the chain 
  cur     <- list(th=th.init, a=a.init, b=b.init, s2=s2.init,
                  hyperpars=hyperpars,
                  MH = list(th=MH.th,    a=MH.a,    b=MH.b),
                  ACC= list(th=0,th.n=0, a=0,a.n=0,  b=0,b.n=0 ))
    
  ## Define matrix to store MCMC results...
  chain.keep <- matrix( NA, ncol = M.keep,
                        nrow = length(th.init) 
                               + length(a.init)
                               + length(b.init) 
                               + length(s2.init))
  rownames(chain.keep) <- c( 
        paste('theta.abl', 1:length(th.init)),
        paste('a.disc',  1:length(a.init)),
        paste('b.diff',  1:length(b.init)),
        'sig2.theta')
 
  # Burn-in phase: do not keep these results
  if( M.burnin > 0 ) {
    for(ii in 1:M.burnin ) {
      cur <- blocked.mcmc.update(U.data, cur) 
  }}
  
  # Converged phase: Keep these results after thinning
  for (m in 1:M.keep) {
    # Skip the "thinned" pieces of the chain       
    if( M.thin > 1 ) {
      for( ii in 1:(M.thin-1) ) {
        cur <- blocked.mcmc.update(U.data, cur) 
    }}
    # Generate a "kept" update and save its results
    cur <- blocked.mcmc.update(U.data, cur) 
    chain.keep[,m] <- c( cur$th, cur$a, cur$b, cur$s2 )
 
    if ( m %% 100 == 0) {
      print(m)
      # Adaptive tuning would go here. 
    }
 
  }
 
  if (verbose) {
    cat(paste("Average acceptance rates:",
              "\n theta.abl:", round(cur$ACC$th / cur$ACC$th.n,3),
              "\n a.disc:   ", round(cur$ACC$a  / cur$ACC$a.n,3),
              "\n b.diff:   ", round(cur$ACC$b  / cur$ACC$b.n,3),
              "\n"))
  }
  
  return( chain.keep ) 
}
