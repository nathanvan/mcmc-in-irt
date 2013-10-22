par(mfrow=c(1,2))
   acf( run.B.mcmc[, 'theta.abl 1'],
        main="ACF: correct sampler", col='blue')
   acf( run.B.buggy.th.mcmc[, 'theta.abl 1'],
        main="ACF: buggy sampler", col='purple')
par(mfrow=c(1,1))
