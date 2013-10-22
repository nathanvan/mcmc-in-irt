## Helper function to evaluate the log-likelihood of the
## 2PL model
##
## Output : A matrix such that the
##             column sums are item log-likelihood values, and
##             row sums are person log-likelihood values.
log.prob <- function(U.data, th, a, b) {
  ## Step 1: Build the inverse-logit of 
  ##            a.disc[ii] * ( theta.abl[[pp]] - b.diff[[ii]] )
  ##     as a matrix.
  ## 
  ## ... the term " a.disc[ii] * theta.abl[[pp]] " 
  ## ... ... becomes an outer product
  term.1     <- outer(th, a)
  ## ... the term " a.disc[ii] * b.diff[[ii]] " 
  ## ... ... is the same for all rows 
  term.2     <- matrix(rep(a*b, P.persons), nrow=P.persons, 
                byrow=TRUE)
  ## ... the plogis function is R's implementation of the
  ##     inverse logit 
  P.prob <- plogis(term.1 - term.2) #### 1/(1 + exp(term.2 - term.1))

  ## Step 2: Build the Bernoulli log-likelihood for the 2PL model
  log.bernoulli <- U.data*log(P.prob) + (1-U.data)*log(1-P.prob)
  return(log.bernoulli)
}
