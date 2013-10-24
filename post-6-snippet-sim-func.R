## A function to check if the parameter is less than three
is.three.less.than <- function( b.value ) {
  return( 3 < b.value )
}

## A very similar function
is.two.less.than <- function( b.value ) {
  return( 2 < b.value )
}

## Testing them out
c( is.three.less.than(2), is.three.less.than(4),
   is.two.less.than(1), is.two.less.than(3) )
## [1] FALSE  TRUE FALSE  TRUE
##
## As expected.