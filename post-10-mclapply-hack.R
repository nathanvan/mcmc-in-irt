## Define a hackish version of mclapply for Windows
## Now we need wrap all of this in a function
mclapply.hack <- function(...) {
    ## Create a cluster
    cl <- makeCluster( detectCores() )

    ## Find out the loaded packages 
    loaded.package.names <- c(
        ## Base packages
        sessionInfo()$basePkgs,
        ## Additional packages
        names( sessionInfo()$otherPkgs ))

    tryCatch( {
       ## Modify the function to apply with the "header"
       ## needed to load R packages 
       tmp.function <- list(...)[[2]]
       tmp.function <- trace( tmp.function,
              quote(lapply(loaded.package.names, function(xx) {
                 require(xx , character.only=TRUE)})),
             at=c(1))

       ## Export every variable in every environment that is
       ## in scope.
       this.env <- environment()
       while( identical( this.env, globalenv() ) == FALSE ) {
           clusterExport(cl,
                         ls(all.names=TRUE, env=this.env),
                         envir=this.env)
           this.env <- parent.env(environment())
       }
       clusterExport(cl,
                     ls(all.names=TRUE, env=globalenv()),
                     envir=globalenv())       
       
       ## Run the lapply in parallel 
       return( parLapply( cl, list(...)[[1]], tmp.function ) )
    }, finally = {        
       ## Stop the cluster
       stopCluster(cl)
    })
}

## Warn the user if they are using Windows
if( Sys.info()[['sysname']] == 'Windows' ){
    message(paste(
      "\n", 
      "   *** Microsoft Windows detected ***\n",
      "   \n",
      "   For technical reasons, the MS Windows version of mclapply()\n",
      "   is implemented as a serial function instead of a parallel\n",
      "   function.",
      "   \n\n",
      "   As a quick hack, we replace this serial version of mclapply()\n",
      "   with a wrapper to parLapply() for this R session. Please see\n\n",
      "      http://mcmcinirt.stat.cmu.edu \n\n",
      "   for details.\n\n"))
}

## If the OS is Windows, set mclapply to the
## the hackish version. Otherwise, leave the
## definition alone. 
mclapply <- switch( Sys.info()[['sysname']],
   Windows = {mclapply.hack}, 
   Linux   = {mclapply},
   Darwin  = {mclapply})
