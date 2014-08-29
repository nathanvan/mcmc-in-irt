## Run in serial 
system.time( serial.output <- lapply( 1:4, wait.then.square ) )
##  user  system elapsed 
## 0.000   0.000   40.023 
