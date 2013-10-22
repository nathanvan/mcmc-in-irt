## Introduce a bug into the calculation of the log-likelihood
log.prob.buggy <- function(U.data, th, a, b) {
  term.1     <- outer(th, b) ## This should be 'a' not 'b'
  term.2     <- matrix(rep(a*b, P.persons), nrow=P.persons, 
                byrow=TRUE)
  P.prob <- plogis(term.1 - term.2) 
 
  log.bernoulli <- U.data*log(P.prob) + (1-U.data)*log(1-P.prob)
  return(log.bernoulli)
}
