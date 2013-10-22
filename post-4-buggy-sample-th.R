sample.th.buggy <- function(U.data, old) {
 th.old    <- old$th
 MH.th     <- old$MH$th
 P.persons <- length(th.old)
 th.star   <- rnorm(P.persons,th.old,MH.th)
 
 log.cc.star <- apply(
                   log.prob(U.data, th.star, 
                            old$a, old$b),1,sum) +
                   log(dnorm(th.star,0,sqrt(old$s2)))
 log.cc.old  <- apply(
                   log.prob(U.data, th.old, 
                            old$a, old$b),1,sum) +
                   log(dnorm(th.old ,0,sqrt(old$s2))) 
 log.prop.star <- log(dnorm(th.star,th.old,MH.th))
 log.prop.old  <- log(dnorm(th.old,th.star,MH.th))

 ## Bug: add log.prop.star, instead of subtract
 log.alpha.star <- pmin(log.cc.star + log.prop.old - log.cc.old +
                    log.prop.star,0) 

 acc.new <- ifelse(log(runif(P.persons))<=log.alpha.star, 1, 0)
 
 cur          <- old   
 cur$th       <- ifelse(acc.new==1, th.star, th.old)
 cur$ACC$th   <- old$ACC$th + mean( acc.new )
 cur$ACC$th.n <-  cur$ACC$th.n + 1
 
 return(cur) 
}
