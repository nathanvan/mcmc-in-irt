## We'll be doing these checks a lot, so let's make a function
check.sampler.graph <- function(true.values, estimated.values,
                                desc, ylab, col) {    
par(mfrow=c(1,2))
  plot( true.values, estimated.values,
      xlab='True values', ylab=ylab,
      main=paste('Parameter recovery:',desc),
      col=col)
  abline(0,1)

  plot( ecdf( true.values ), xlab=deparse(substitute(true.values)),
        main=paste('Empirical CDFs:',desc) )
  plot( ecdf( estimated.values ), col=col, lty='dashed', add=TRUE )
  legend( 'topleft', c('True values', ylab), col=c('black', col),
           lty=c('solid','dashed'), bg='white')
   ## Add in the KS test
  legend( 'bottomright',
           paste("Kolmogorov-Smirnov p value:",
             round( ks.test( true.values, estimated.values )$p.value, 2)),
         bg='white')
par(mfrow=c(1,1))
}
