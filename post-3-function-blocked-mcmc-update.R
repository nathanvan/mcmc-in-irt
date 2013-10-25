## Define a single iteration of the MH within Gibbs sampler
blocked.mcmc.update  <- function( U.data, cur){
  cur <- sample.th(U.data, cur)  
  cur <-  sample.a(U.data, cur)  
  cur <-  sample.b(U.data, cur)  
  cur <- sample.s2(U.data, cur)  
  return(cur)
}
