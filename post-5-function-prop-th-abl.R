## Proposal function for the person ability parameters
prop.th.abl <- function( state ) {
    
    ## Extract parameters from the state
    ## ... Previously:
    ##         th.old    <- old$th
    ##         MH.th     <- old$MH$th
    ## ... Now:
    th.old <- state$th 
    MH.th  <- state$MH$th

    ## Draw the proposal to update the state
    ## ... Previously:
    ##         P.persons <- length(th.old)
    ##         th.star   <- rnorm(P.persons,th.old,MH.th)
    ## ... Now: 
    state$th <- rnorm( length( th.old ), mean=th.old, sd=MH.th )

    ## Build a function to return the density of the proposal
    ## ... Previously:
    ##         log.prop.star <- log(dnorm(th.star,th.old,MH.th))
    ##         log.prop.old  <- log(dnorm(th.old,th.star,MH.th))
    ## ... Now, we define the function 
    log.density <- function( state.to, state.from ) {
       dnorm( x    = state.to$th,
              mean = state.from$th,
              sd   = MH.th,
              log  = TRUE )
    }
    
    ## Return the proposal object
    ## ... Note that we'll need the name of the parameter later,
    ##     so return it too
    return( list( param.name='th', state=state,
                  log.density=log.density ))
}