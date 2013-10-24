## Define the person ability sampler 
sample.th.refactor <- function( U.data, old ) {
    mh.sample( U.data, old,
               cc.log.density    = th.abl.cc, 
               proposal.function = prop.th.abl
              )
}
