## Calculate buggy EAP estimates
theta.eap.B.buggy.th <- apply( 
       run.B.buggy.th.mcmc[, get.2pl.params(1:P.persons, NULL, NULL, NULL)],
       MARGIN=2,
       mean )

## Visually check
check.sampler.graph(theta.abl, theta.eap.B.buggy.th, 'Person Ability',
                    'Buggy EAP estimates', 'purple')
