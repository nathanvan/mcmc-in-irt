## A generic MH sampler
mh.sample <- function( U.data, old.state,
                       cc.log.density, proposal.function ) {
    
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

    ## Step 3: Accept proposal draws
    ## ... Flip coins with the calculated probabilities  
    acc.new <- ifelse(
        log(runif( length(log.alpha.star) )) <= log.alpha.star,
        1, 0 )
    ##
    ## ... Update the chain to its "current" state
    ## ... ... Copy the old state object
    cur.state  <- old.state
    ## ... ... Update the state object for this parameter 
    cur.state[[ prop$param.name ]] <- ifelse(
        acc.new==1,
        prop$state[[ prop$param.name ]],
        old.state[[  prop$param.name ]])

    ## Step 4: Update the acceptance probability 
    ## ... add the new average acceptance probability
    cur.state$ACC[[ prop$param.name ]]  <- (
       old.state$ACC[[ prop$param.name ]] + mean( acc.new )
    )
    ## ... record that we added a new acceptance probability 
    name.n <- paste( prop$param.name, ".n", sep="")
    cur.state$ACC[[ name.n ]] <-  old.state$ACC[[name.n]] + 1

    ## Step 5: Return the current state
    return(cur.state)
}
