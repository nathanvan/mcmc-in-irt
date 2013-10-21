## Define the dummy complete conditional sampler
dummy.cc.sampler  <- function(U.data, cur){ return(cur) }

## Set all complete conditional samplers to the dummy sampler
sample.th         <- dummy.cc.sampler
sample.a          <- dummy.cc.sampler
sample.b          <- dummy.cc.sampler
sample.s2         <- dummy.cc.sampler

## Define a single iteration of the MH within Gibbs sampler
blocked.mcmc.update  <- function( U.data, cur){
  cur <- sample.th(U.data, cur)  
  cur <-  sample.a(U.data, cur)  
  cur <-  sample.b(U.data, cur)  
  cur <- sample.s2(U.data, cur)  
  return(cur)
}
