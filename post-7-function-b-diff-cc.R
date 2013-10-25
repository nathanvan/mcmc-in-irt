## Complete conditional for the item discrimination parameters
b.diff.cc <- function( U.data, state ) {
    return(
        ## Calculate the log-likelihood term
        apply(log.prob(U.data, state$th, state$a, state$b),2,sum)
        ## And add the prior log-density term
      + dnorm(state$b,
              0,
              sqrt(state$hyperpar$s2.b),
              log=TRUE)
    )
}