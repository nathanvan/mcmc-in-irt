## A snippet of the generic sampler 
mh.sample <- function( U.data, old.state,
                       cc.log.density,
                       proposal.function
                      ) {
    
    ## Step 1: Call the proposal function
    prop <- proposal.function( old.state )
    ## which returns:
    ## ... prop$param.name, the name of the parameter 
    ## ... prop$state, the new state object 
    ## ... prop$log.density, the log density of the proposal

    ## Step 2: Calculate the (log) acceptance probability 
    log.alpha.star <- (
        ## Complete conditional at the proposal 
        cc.log.density(   U.data, prop$state )
        ##
        ## Complete conditional at the "old" value
        - cc.log.density( U.data, old.state )
        ##
        ## Proposal density calculated to the proposal
        + prop$log.density( prop$state, old.state )
        ##
        ## Proposal density calculated to the "old" value
        - prop$log.density( old.state, prop$state )
    )

   ## ... snip ...
}
