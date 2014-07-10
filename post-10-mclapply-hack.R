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
    warning(paste(
      "   *** Microsoft Windows detected ***\n",
      "   \n",
      "   For technical reasons, the MS Windows version of mclapply()\n",
      "   is implemented as a serial function instead of a parallel\n",
      "   function.",
      "   \n\n",
      "   As a quick hack, we replace this serial version of mclapply()\n",
      "   with a wrapper to parLapply(). See 'mclapply.windows' for \n",
      "   details.",
      "   \n\n"))
}

## If the OS is Windows, set mclapply to the
## the hackish version. Otherwise, leave the
## definition alone. 
mclapply <- switch( Sys.info()[['sysname']],
   Windows = {mclapply.windows}, 
   Linux   = {mclapply},
   Darwin  = {mclapply})
