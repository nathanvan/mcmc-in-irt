## Complete conditional for the person ability parameters 
th.abl.cc <- function( U.data, state ) {
    return(
       ## Calculate the log-likelihood term
       apply( log.prob(U.data, state$th, state$a, state$b),1,sum)
       ## And add the prior log-density term 
     + dnorm(state$th, 0, sqrt(state$s2), log=TRUE)
    )
}
