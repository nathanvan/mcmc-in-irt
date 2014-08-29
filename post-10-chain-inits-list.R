chain.inits <- list(
   ## A chain with small values  
   chain1 = init.chain( 1, P.persons, I.items,
              theta.mean = -10    , theta.sd = 1,
              a.scale    =   0.001,
              b.mean     =  -10    , b.sd     = 1,
              s2.init    =   0.75 ),
   ## A chain near the true values
   chain2 = init.chain( 1, P.persons, I.items,
              theta.mean = 0  , theta.sd = 1,
              a.scale    = 0.1,
              b.mean     = 0  , b.sd     = 1,
              s2.init    = 1 ), 
   ## A chain with large values 
   chain3 = init.chain( 1, P.persons, I.items,
              theta.mean =  10 , theta.sd = 1,
              a.scale    =   1 ,
              b.mean     =  10 , b.sd    = 1,
              s2.init    =   3 )
    )