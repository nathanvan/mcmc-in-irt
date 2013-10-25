## Define the dummy complete conditional sampler
dummy.cc.sampler  <- function(U.data, cur){ return(cur) }

## Set all complete conditional samplers to the dummy sampler
sample.th         <- dummy.cc.sampler
sample.a          <- dummy.cc.sampler
sample.b          <- dummy.cc.sampler
sample.s2         <- dummy.cc.sampler
