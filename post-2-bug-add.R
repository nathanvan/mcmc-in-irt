## re-set the seed to keep results reproducible 
set.seed(314159)

## term.1 and term.2 should be subtracted, not added:
P.prob.buggy  <- plogis(term.1 + term.2)
U.buggy       <- ifelse(runif(I.items*P.persons)<P.prob.buggy,1,0)
