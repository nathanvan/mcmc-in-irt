require(ltm)
## If the above command fails, you must install the 
## ltm library. To do so, un-comment the install.packages 
## line below, run it, and follow the directions it gives.
##
## install.packages('ltm')

## Fit a 2PL IRT model with ltm() and store the resulting
## object in ml.check 
ml.check  <- ltm( U ~ z1, IRT.param=TRUE )
## See
##    help(ltm)
## for details on its syntax.

## Extract out the discrimination and difficulty parameters
ml.a.disc <- coef(ml.check)[,'Dscrmn'] 
ml.b.diff <- coef(ml.check)[,'Dffclt']
