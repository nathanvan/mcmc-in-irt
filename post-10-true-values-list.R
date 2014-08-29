## Setup true values as a similar list 
true.values <- c( theta.abl, a.disc, b.diff, sig2.theta )
names( true.values) <- get.2pl.params( 1:P.persons, 1:I.items,
                                       1:I.items, 1 )