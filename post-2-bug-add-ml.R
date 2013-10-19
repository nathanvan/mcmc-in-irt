## Calculate the "buggy" ltm estimates
ml.check.buggy  <- ltm( U.buggy ~ z1, IRT.param=TRUE )
ml.a.disc.buggy <- coef(ml.check.buggy)[,'Dscrmn'] 
ml.b.diff.buggy <- coef(ml.check.buggy)[,'Dffclt']

## Equate the "buggy" ltm estimates
equated.a.disc.buggy <- equate.2pl.a.disc( 
                           ml.a.disc.buggy, ml.b.diff.buggy,
                           a.disc         , b.diff )
equated.b.diff.buggy <- equate.2pl.b.diff( 
                           ml.a.disc.buggy, ml.b.diff.buggy,
                           a.disc         , b.diff )
