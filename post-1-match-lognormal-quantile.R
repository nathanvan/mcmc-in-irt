require(truncnorm)
## If the above command fails, you must install the 
## truncnorm library. To do so, un-comment the install.packages 
## line below, run it, and follow the directions it gives.
##
## install.packages('truncnorm')
 
## We use the quantile function to determine the critical 
## value where 95% of the mass of a normal distribution 
## truncated at zero (a=0), with a mean of 0 (mean=0) and 
## standard deviation of 10 (sd=10) lies. 
qtruncnorm(p=.95, mean=0, sd=10, a=0) 
# [1] 19.59964
 
## We used a guess and check method to find the
## corresponding quantile for a mode 1 log-normal distribution
xx = 1.185 ;qlnorm(.95, xx, sqrt(xx))
# [1] 19.6004
