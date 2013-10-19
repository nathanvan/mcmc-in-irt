## Set a 2 by 1 grid for the graphs
par(mfrow=c(1,2))

## Adjust the margins of the plot 
par(mar=c(4,4,4,2))

## Plot the zoomed in CDF of the truncated normal
curve( ptruncnorm(q=x, a=0, mean=0, sd=sqrt(100)), from=0, to=1,
       main="Zoomed in", lty='dotted', lwd=2,
       xlab='quantile', ylab='probability')

## Add the CDF of the log-normal to the graph
curve( plnorm(q=x, mean=1.185, sd=sqrt(1.185)), from=0, to=1,
       add=TRUE, lwd=2, col='blue')

## Draw an arrow approximately where the two CDFs cross
arrows( x0=0.325, y0=.038, x1=0.45,  y1=.038,
        length=1/8)

## Draw the legend
legend( "topleft", c('truncated b_i prior', 'log-normal'),
        col=c('black','blue'), lwd=2, lty=c('dotted', 'solid'))

## Draw the zoomed out truncated normal CDF in the second panel
## N.B. It draws in the second panel because add=TRUE is missing.
curve( ptruncnorm(q=x, a=0, mean=0, sd=sqrt(100)), from=0, to=60,
             main="Zoomed out", lwd=2, lty='dotted',
        xlab='quantile', ylab='probability')

## Add the the CDF of the log-normal to the graph
curve( plnorm(q=x, mean=1.185, sd=sqrt(1.185)), from=0, to=60,
       add=TRUE, lwd=2, col='blue')

## Draw an arrow approximately where the two CDFs cross
arrows( x0=10, y0=.95, x1=16.6,  y1=.95,
        length=1/8)

## Reset to a 1 by 1 grid for any future graphs
par(mfrow=c(1,1))
