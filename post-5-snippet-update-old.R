 ## Update the chain 
 cur          <- old   
 cur$th       <- ifelse(acc.new==1, th.star, th.old)

 ## Calculate acceptance probabilities (for tuning)
 cur$ACC$th   <- old$ACC$th + mean( acc.new )
 cur$ACC$th.n <-  cur$ACC$th.n + 1