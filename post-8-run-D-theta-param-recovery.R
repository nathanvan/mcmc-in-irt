## Calculate the EAP estimates
all.eap <- apply( run.D.mcmc.conv, MARGIN=2, mean )
## Visualize 
check.sampler.graph(
    theta.abl,
    all.eap[ get.2pl.params(1:P.persons,NULL,NULL,NULL)],
    desc="Person Ability", ylab="EAP Estimates", col="blue" )