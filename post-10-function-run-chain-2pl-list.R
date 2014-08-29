## run.chain.2pl.list 
## 
## A wrapper to call run.chain.2pl with mclapply() in order to 
## run MCMC chains in parallel. Returns a coda::mcmc.list.
## 
## Inputs: 
##   seq.of.random.seeds   A sequence of random seeds, one for 
##                         each chain.
##   init.list             mcmc.list of initial values 
##   MH.th.list            tuning parameters for theta.abl 
##   MH.a.list             tuning parameters for a.disc
##   MH.b.list             tuning parameters for b.diff 
##   ...                   the remaining arguments for run.chain.2pl
run.chain.2pl.list <- function(seq.of.random.seeds, init.list,
    MH.th.list, MH.a.list, MH.b.list,
    ... ) {

    ## N.B. the length of seq.of.random.seeds is the number of 
    ##      chains to be run
    ## 
    chain.list <- mclapply(1:length(seq.of.random.seeds),
       function( ii ) {           
           ## Set the seed for this core
           this.seed <- seq.of.random.seeds[[ii]]
           print(paste("Setting the seed to", this.seed))
           set.seed(this.seed)

           ## Run the chain on this core
           ## N.B. la.get.all() is a helper function to extract 
           ##      the relevant initial values for the init.list 
           ##      data structure.  
           this.chain <- run.chain.2pl(
              th.init = la.get.all(init.list, 'theta.abl')[[ii]],
              a.init  = la.get.all(init.list, 'a.disc')[[ii]],
              b.init  = la.get.all(init.list, 'b.diff')[[ii]],
              s2.init = la.get.all(init.list, 'sig2.theta')[[ii]],
              ## Set the tuning from the inits list
              MH.th = MH.th.list[[ii]],
              MH.a  = MH.a.list[[ii]],
              MH.b  = MH.b.list[[ii]],
              ... ## Set everything else 
               )
           
           ## Return the chain from this core
           return( this.chain ) }, 
       mc.cores=min(length( seq.of.random.seeds), detectCores() )
    )

    ## Save the initial random seed as the name of the chain 
    names(chain.list) <- unlist(seq.of.random.seeds)
    
    ## Convert to a coda::mcmc.list object 
    converted.chain <- mcmc.list( 
      lapply( chain.list, function(xx) {
         mcmc(  t(xx),
                start=(list(...)$M.burnin + list(...)$M.thin),
                thin=list(...)$M.thin)
      }))

    return(converted.chain)
}