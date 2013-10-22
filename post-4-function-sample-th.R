## Complete conditional sampler for the person ability parameters
sample.th <- function(U.data, old) {
 ## Access the current (soon to be old) state  of the chain
 ## N.B. This is vector. All of operations in this function
 ##      are on the complete vector insted of element-at-a-time
 th.old    <- old$th

 ## Draw the MH proposal
 ## ... get the MH proposal variance
 MH.th     <- old$MH$th
 ## ... get the number of persons in the data
 P.persons <- length(th.old)
 ## ... draw a new person ability parameter for each person
 ##     centered around their previous (th.old) parameter, with
 ##     a fixed variance (MH.th)
 th.star   <- rnorm(P.persons,th.old,MH.th)

 ## Calculate the probablity of accepting the proposal draw
 ## ... N.B. All calculations are done on the log scale to keep
 ##          numerical accuracy when dealing with such small numbers
 ## ... The acceptance probablity is a function of four things:
 ##
 ## ... ... 1: The complete conditional evaluated at the proposal     
 log.cc.star <- (
     ## ... ... likelihood term
     apply(log.prob(U.data, th.star, old$a, old$b),1,sum)
     ## ... ... prior term
     + log(dnorm(th.star,0,sqrt(old$s2))))
 ##
 ## ... ... 2: The complete conditional evaluated at the "old" value
 log.cc.old  <- (
     ## ... ... likelihood term
     apply(log.prob(U.data, th.old, old$a, old$b),1,sum)
     ## ... ... prior term 
     + log(dnorm(th.old,0,sqrt(old$s2))))
 ##
 ## ... ... 3: The MH proposal density evaluted at the proposal
 log.prop.star <- log(dnorm(th.star,th.old,MH.th))
 ##   
 ## ... ... 4: The MH proposal density evaluted at the "old" value
 log.prop.old  <- log(dnorm(th.old,th.star,MH.th))
 ## 
 ## ... Calculate the acceptance probability on the log scale
 log.alpha.star <- pmin(log.cc.star + log.prop.old - log.cc.old -
                    log.prop.star,0)
     
 ## Accept or reject the proposals by flipping coins with the
 ## calculated acceptance probabilities 
 acc.new <- ifelse(log(runif(P.persons))<=log.alpha.star, 1, 0)

 ## Update the chain 
 cur          <- old   
 cur$th       <- ifelse(acc.new==1, th.star, th.old)

 ## Calculate acceptance probablities (for tuning)
 cur$ACC$th   <- old$ACC$th + mean( acc.new )
 cur$ACC$th.n <-  cur$ACC$th.n + 1
 
 return(cur) 
}
