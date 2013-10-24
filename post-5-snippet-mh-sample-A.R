## A snippet of the generic sampler 
mh.sample <- function( old.state,
                       proposal.function
                       ## ... snip ...
                      ) {
    
    ## Step 1: Call the proposal function
    prop <- proposal.function( old.state )
    ## which returns:
    ## ... prop$param.name, the name of the parameter 
    ## ... prop$state, the new state object 
    ## ... prop$log.density, the log density of the proposal

    ## Step 2: Calculate the (log) acceptance probability 
    log.alpha.star <- (
        ##
        ## ... snip ... 
        ##
        ## Proposal density calculated to the proposal
        + prop$log.density( prop$state, old.state )
        ##
        ## Proposal density calculated to the "old" value
        - prop$log.density( old.state, prop$state )
    )

   ## ... snip ...
}
