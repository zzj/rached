rached
=======

A cache library written in R.

Function Definition:
rached.memoise(functor, functionname, version=0)

R does not pass the function name with the functor, therefore, user need to specify the name in the rached.memoise function to avoid name conflicts in the cache.

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
    b.cached <- rached.memoise(b, 'b', version=1) # default version is 0, and the new added parameter
                                                  # will just invalidate older cached values.

 
TODO:

1. Automatically delete old cached values.
2. Add expire parameters.
3. Use other storage method instead of relying on the normal filesystem.
