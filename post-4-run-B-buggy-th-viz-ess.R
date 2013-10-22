## Effective sample size of the correct sampler
ess.run.B <- effectiveSize(
  run.B.mcmc[ , get.2pl.params(1:P.persons, NULL, NULL, NULL)]
) 

## Effective sample size of the bug #2 sampler
ess.run.B.buggy.th <- effectiveSize(
  run.B.buggy.th.mcmc[, get.2pl.params(1:P.persons, NULL, NULL, NULL)]
) 

## Compare the two distributions
boxplot( ess.run.B, ess.run.B.buggy.th,
         main="Effective Sample Size comparison",
         names=c("Correct sample.th", "Buggy sample.th"),
         col=c("lightblue","mediumpurple"))
