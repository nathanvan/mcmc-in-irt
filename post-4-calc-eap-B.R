## Get the EAP estimates
theta.eap.B <- apply( 
       run.B.mcmc[, get.2pl.params(1:P.persons, NULL, NULL, NULL)],
       MARGIN=2,
       mean )
