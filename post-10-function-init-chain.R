init.chain <- function( seed.value, P.persons, I.items,
                        theta.mean, theta.sd,
                        a.scale, b.mean, b.sd,
                        s2.init ) {
    ## Reset the seed each time to remove dependence on
    ## previous draws 
    set.seed(seed.value) 
    theta.init <- rnorm(P.persons, theta.mean, theta.sd)
    
    set.seed(seed.value) 
    a.init     <- exp(rnorm(I.items, a.scale,  sqrt(a.scale)  ))
    
    set.seed(seed.value) 
    b.init     <- rnorm(I.items, b.mean, b.sd)

    ## Create the initial values as named list 
    vals <- c( theta.init, a.init, b.init, s2.init )
    names(vals) <- get.2pl.params(1:P.persons, 
                                  1:I.items, 1:I.items, 1) 

    return(vals)            
}
