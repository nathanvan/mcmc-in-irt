## Define a hackish version of mclapply for Windows
mclapply.windows <- function(...) {
 cl <- makeCluster( detectCores() )
 tryCatch({
   val <- parLapply(cl, ...)
   return(val)
   }, 
   error   = function(cond) {return(cond)},
   warning = function(cond) {return(cond)},
   finally = {
     stopCluster(cl)
   })
}

## Warn the user if they are using Windows
if( Sys.info()[['sysname']] == 'Windows' ){
    warning("parallel::mclapply modified for this R session.")
}

## If the OS is Windows, set mclapply to the
## the hackish version. Otherwise, leave the
## definition alone. 
mclapply <- switch( Sys.info()[['sysname']],
   Windows = {mclapply.windows}, 
   Linux   = {mclapply},
   Darwin  = {mclapply})
