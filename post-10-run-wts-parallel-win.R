source("http://mcmcinirt.stat.cmu.edu/setup/post-10-mclapply-hack.R")
##
##  *** Microsoft Windows detected ***
##  
##  For technical reasons, the MS Windows version of mclapply()
##  is implemented as a serial function instead of a parallel
##  function.
##
##  As a quick hack, we replace this serial version of mclapply()
##  with a wrapper to parLapply() for this R session. Please see
##
##    http://www.stat.cmu.edu/~nmv/2014/07/14/implementing-mclapply-on-windows 
##
##  for details.


system.time( par.output <- mclapply( 1:4, wait.then.square,
                                     mc.cores=4             ) )
## starting worker pid=5512 on localhost:11616 at 12:30:30.691
## ... snip ...
## Loading required package: parallel
## ... snip ... 
##
## Attaching package: 'parallel'
## 
## The following object is masked _by_ '.GlobalEnv':
## 
##     mclapply
##
## ... snip ...
##
##  user  system elapsed 
##   0.05    0.02   11.39 
