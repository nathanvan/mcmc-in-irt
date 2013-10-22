## Calculate buggy EAP estimates
theta.eap.B.buggy <- apply( 
       run.B.buggy.mcmc[, get.2pl.params(1:P.persons, NULL, NULL, NULL)],
       MARGIN=2,
       mean )

## Visually check
check.sampler.graph(theta.abl, theta.eap.B.buggy, 'Person Ability',
                    'Buggy EAP estimates', 'purple')
