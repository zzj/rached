rached
=======

A cache library written in R.

Function Usage:

    b <- function(x, y, z) {
        return (x + y + z)
    }      
    b.cached <- rached.memoise(b, 'b') # claim a cached version.
    b.cached(1, 2, 3) # The b function is called.
    b.cached(1, 2, 3) # The b function is not called, directly return cached value.
    
When the logic of function is changed, you should add version parameter, and increase the version number by 1.

    b <- function(x, y, z) {
        return (x + y - z)  # change from '+' to '1'
    }      
    b.cached <- rached.memoise(b, 'b', version=1) # default version is 0, and the new added parameter will just invalid older cached value.

 
