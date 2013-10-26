check.sigma <- function( mcmc.conv , xylim) {
    par(mfrow=c(1,2))

    traceplot(mcmc.conv[, 'sig2.theta'],
              smooth=TRUE, ylim=xylim,
              main='Trace plot sig2.theta')
    abline(h=sig2.theta , col='blue')

    densplot( mcmc.conv[, 'sig2.theta'],
             main='Density plot sig2.theta',
             xlab='sig2.theta', xlim=xylim,)
    abline(v=sig2.theta , col='blue')
    abline(v=var(theta.abl), col='purple')

    legend( "topright",
           c('true value','var(theta.abl)'),
           col=c('blue', 'purple'),
           lty='solid')
}
