## We can write a function in R to build those other functions
is.X.less.than <- function( X ) {
  ## Return 
  return(
    ## a function
    function( b.value ) {
      ## that depends on the value of X
      return( X < b.value )
    }
  )
}