rcached
=======

A cache library written in R.

  b <- function(x, y, z) {
    return (x + y + z)
  }      
  b.cached <- rached.memoise(b, 'b')

