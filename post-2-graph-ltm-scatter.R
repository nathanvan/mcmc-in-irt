## Generate the unequated scatter plots side-by-side
par(mfrow=c(1,2))
    plot( a.disc, ml.a.disc, asp=1,
          #xlab='Theoretical', ylab='Empirical',
          xlab="True values", ylab="ltm estimates",
          xlim=c(.5,1.6), ylim=c(.5,1.6),
          main="ltm Item Discrimination")
    abline(0,1)

   plot( b.diff, ml.b.diff,
          asp=1, 
          xlab="True values", ylab="ltm estimates",
          main="ltm Item Difficulty")
    abline(0,1)
