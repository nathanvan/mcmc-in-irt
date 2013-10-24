th.old    <- old$th
MH.th     <- old$MH$th
P.persons <- length(th.old)
th.star   <- rnorm(P.persons,th.old,MH.th)
