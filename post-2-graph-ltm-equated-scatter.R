## Generate the equated scatter plots side-by-side
par(mfrow=c(1,2))
    plot( a.disc, equated.a.disc, asp=1,
          xlab="True values", ylab="Equated ltm estimates",
          xlim=c(.5,1.6), ylim=c(.5,1.6),
          main="Equated ltm Item Discrimination")
    abline(0,1)

   plot( b.diff, equated.b.diff,
          asp=1, 
          xlab="True values", ylab="Equated ltm estimates",
          main="Equated ltm Item Difficulty")
    abline(0,1)
