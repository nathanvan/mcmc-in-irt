## log.prob
##
## Output : A matrix such that the
##          column sums are item log-likelihood values, and
##          row sums are person log-likelihood values.
log.prob <- function(U.data, th, a, b) {
  ## Step 1: Build the matrix of probabilities 
  ##         (see Post 2 for details) 
  term.1     <- outer(th, a)
  term.2     <- matrix(rep(a*b, P.persons), nrow=P.persons, 
                byrow=TRUE)
  P.prob <- plogis(term.1 - term.2) #### 1/(1 + exp(term.2 - term.1))

  ## Step 2: Build the likelihood from Equation 1 on the log scale
  log.bernoulli <- log(P.prob^U.data) + log((1-P.prob)^(1-U.data))
  return(log.bernoulli)
}
