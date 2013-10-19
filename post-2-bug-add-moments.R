## Calculate the "buggy" moments 
emp.1D.buggy  <- apply(U.buggy, MARGIN=2, mean)
emp.2D.buggy  <- rep(NA, choose(I.items, 2) )
for( which.cmbn in 1:choose(I.items,2) ) {
  ii <-  cmbn.matrix[1,which.cmbn]
  jj <-  cmbn.matrix[2,which.cmbn]
  emp.2D.buggy[which.cmbn] <- mean(U.buggy[,ii]*U.buggy[,jj])
}
