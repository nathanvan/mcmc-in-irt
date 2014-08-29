## get.all
##
## Helper function to extract values by parameter name
get.all <- function( named.list , which.param ) {
    trimmed.names <- substr( names(named.list),
                             1, nchar(which.param) )
    return( named.list[ 
       which( trimmed.names %in% which.param )] )
}

## la.get.all
##
## A shortcut for the lapply get.all pattern
la.get.all <- function( list.of.named.lists, which.param) {
    return( lapply( 
       list.of.named.lists, get.all, which.param ) )
}