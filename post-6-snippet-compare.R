## Define them
is.three.less.than <- is.X.less.than( 3 )
is.two.less.than <- is.X.less.than( 2 )

## Use them
c( is.three.less.than(2), is.three.less.than(4),
   is.two.less.than(1), is.two.less.than(3) )
## [1] FALSE  TRUE FALSE  TRUE
##
## As expected.