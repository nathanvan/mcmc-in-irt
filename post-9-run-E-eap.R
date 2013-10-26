## make EAP and check values
all.eap <- apply( run.E.mcmc.conv, MARGIN=2, mean )

## Extract out parameters
eap.th <- all.eap[ get.2pl.params(1:P.persons,NULL,NULL,NULL)]
eap.a  <- all.eap[ get.2pl.params(NULL,1:I.items,NULL,NULL)]
eap.b  <- all.eap[ get.2pl.params(NULL,NULL,1:I.items,NULL)]
