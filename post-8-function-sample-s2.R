sample.s2 <- function(U.data, old) {
  ## Grab the appropriate values
  alpha.th  <- old$hyperpar$alpha.th
  beta.th   <- old$hyperpar$beta.th
  P.persons <- length(old$th)

  ## Update the chain 
  cur    <- old
  cur$s2 <- 1/rgamma(1, shape = alpha.th + P.persons/2,
                        rate  = beta.th + sum((old$th)^2)/2 )
  return(cur)
}
