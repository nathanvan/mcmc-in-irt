## Define the person ability sampler 
sample.th <- function( U.data, old ) {
    mh.sample( U.data, old,
               cc.log.density    = th.abl.cc, 
               proposal.function = prop.th.abl
              )
}

## Define the item discrimination sampler
sample.a <- function( U.data, old ) {
    mh.sample( U.data, old,
               cc.log.density    = a.disc.cc, 
               proposal.function = prop.a.disc
              )
}

## Define the item difficulty sampler
sample.b <- function( U.data, old ) {
    mh.sample( U.data, old,
               cc.log.density    = b.diff.cc, 
               proposal.function = prop.b.diff
              )
}