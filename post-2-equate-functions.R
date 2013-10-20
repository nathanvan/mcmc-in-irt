## The Cook and Eignor (1992) method to equate 
## *this* discrimination parameter with *that* 
## discrimination parameter. 
equate.2pl.a.disc <- function( this.a, this.b, 
                               that.a, that.b ) {
  ## N.B. that.a is not used, but is included 
  ##             for ease of use. 
  return( this.a * sd( this.b ) / sd( that.b ) )
}

## The Cook and Eignor (1992) method to equate 
## *this* difficulty parameter with *that* 
## difficulty parameter.
equate.2pl.b.diff <- function( this.a, this.b, 
                               that.a, that.b ) {
  ## N.B. this.a and that.a are not used, but are 
  ##                        included for ease of use.     
  return( (this.b-mean(this.b))*sd(that.b)/sd(this.b)
          + mean(that.b) )
}
