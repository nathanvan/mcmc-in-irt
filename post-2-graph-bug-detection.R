par(mfrow=c(2,2))
    ## Graph the buggy moments  
    plot( theo.1D, emp.1D.buggy, asp=1,
          main='1D Moments -- Intentional Bug',
          xlab='Theoretical', ylab='Empirical (Buggy)')
    abline(0,1)
    plot( theo.2D, emp.2D.buggy, asp=1,
          main='2D Moments -- Intentional Bug',
          xlab='Theoretical', ylab='Empirical (Buggy)')
    abline(0,1)

    ## Graph the buggy equated ltm estimates
    plot( a.disc, equated.a.disc.buggy, asp=1,
          main="Equated ltm Item Discrimination -- Intentional Bug",
          xlab="True values", ylab="Equated ltm estimates (Buggy)")
    abline(0,1)
    plot( b.diff, equated.b.diff.buggy, asp=1,
          main="Equated ltm Item Difficulty -- Intentional Bug",
          xlab="True values", ylab="Equated ltm estimates (Buggy)")
        abline(0,1)
