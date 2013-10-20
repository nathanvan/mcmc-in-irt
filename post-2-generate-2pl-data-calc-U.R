## the I x P matrix of response probabilities
term.1     <- outer(theta.abl, a.disc)
term.2     <- matrix( rep(a.disc*b.diff, P.persons), 
                      nrow=P.persons, byrow=TRUE)
P.prob     <- plogis(term.1-term.2) # 1/(1 + exp(term.2 - term.1))

## generate the 0/1 responses U as a matrix of Bernoulli draws
U          <- ifelse(runif(I.items*P.persons) < P.prob,1,0)
