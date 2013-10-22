## N.B. get.2pl.params can give the same values as first.names
all.equal( get.2pl.params( 1, 1, 1, 1 ), first.names)
## [1] TRUE

## So now we can look at the first five samples of the first
## three item discrimination parameters
run.A[ get.2pl.params(NULL, 1:3, NULL, NULL), 1:5]
##               [,1]      [,2]      [,3]      [,4]      [,5]
## a.disc 1 0.7120615 0.7120615 0.7120615 0.7120615 0.7120615
## a.disc 2 1.1440699 1.1440699 1.1440699 1.1440699 1.1440699
## a.disc 3 0.7326655 0.7326655 0.7326655 0.7326655 0.7326655
