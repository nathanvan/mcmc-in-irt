## The dimension of U is 2000 (persons) by 30 (items)
dim(U)
#[1] 2000   30

## To calculate the item averages, we 'apply' the 'mean'
## function on the columns of items. We select the columns
## with 'MARGIN=2' (the first margin is the rows, the second
## is the columns).
emp.1D  <- apply(U, MARGIN=2, mean)
