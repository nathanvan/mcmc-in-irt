## 9 person ability parameters
plot( run.C.mcmc[, get.2pl.params(1:9,NULL,NULL,NULL)], 
      density=FALSE, ylim=c(-5,5) )

## 9 item discrimination parameters
plot( run.C.mcmc[, get.2pl.params(NULL,1:9,NULL,NULL)], 
      density=FALSE, ylim=c(-2,2) )

## 9 item difficulty parameters
plot( run.C.mcmc[, get.2pl.params(NULL,NULL,1:9,NULL)], 
      density=FALSE, ylim=c(-4,-1) )