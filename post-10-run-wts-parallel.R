## The following script does two things: 
##   (i)  it loads the parallel R package, and
##   (ii) if the current R session is running on a Windows
##        machine, it implements a custom version of
##        parallel:mclapply(). 
source("http://mcmcinirt.stat.cmu.edu/setup/post-10-mclapply-hack.R")

## Note two changes to the wait.then.square call: 
##   (i)   lapply becomes mclapply, and 
##   (ii)  mc.cores (the number of processors to use in parallel)
##         is set to 4. 
system.time( par.output <- mclapply( 1:4, wait.then.square,
                                     mc.cores=4             ) )
##  user  system elapsed 
## 0.008   0.000   1.008 
