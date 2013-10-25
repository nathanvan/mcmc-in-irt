## Complete conditional for the item discrimination parameters
a.disc.cc <- function( U.data, state ) {
    return(
        ## Calculate the log-likelihood term
        apply(log.prob(U.data, state$th, state$a, state$b),2,sum) 
        ## And add the prior log-density term
      + dlnorm(state$a,
               state$hyperpar$mu.a,
               sqrt(state$hyperpar$s2.a),
               log=TRUE)
    )
}

