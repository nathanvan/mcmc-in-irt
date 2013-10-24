## Write a function to return a proposal function for that parameter
generic.normal.proposal <- function( param.name ) {
   return(
        function( state ) {
            ## Extract parameters from the state
            param.old <- state[[param.name]]
            ## th.old <- state$th             
            
            MH.param  <- state$MH[[param.name]]
            ## MH.th  <- state$MH$th
            
            ## Draw the proposal to update the state
            state[[param.name]] <- rnorm( 
                                     length( param.old ), 
                                     mean=param.old,
                                     sd=MH.param )
            ## state$th         <- rnorm( 
            ##                       length( th.old ), 
            ##                       mean=th.old,
            ##                        sd=MH.th )

            ## Build a function to return the density of the proposal
            log.density <- function( state.to, state.from ) {
               dnorm( x    = state.to[[param.name]],
                      ##     state.to$th,

                      mean = state.from[[param.name]],
                      ##     state.from$th,

                      sd   = MH.param,
                      ##     MH.th,
                     
                      log  = TRUE )
            }

            ## Return the proposal object
            return( list( param.name=param.name, state=state,
            ##      list( param.name='th', state=state,
            ##             
                          log.density=log.density ))
        }
   )
}