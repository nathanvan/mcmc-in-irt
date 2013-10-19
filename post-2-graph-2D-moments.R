## Draw a scatter plot with the theoretical values
## on the x-axis and the empirical values on the y-axis.
plot( theo.2D, emp.2D, asp=1,
      main='2D Moments',
      xlab='Theoretical', ylab='Empirical')
## Draw a 45 degree line through the origin
abline(0,1)
