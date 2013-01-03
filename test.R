source('rached.R')
a <- function(b) {
  return(b)
}

a.cached <- memoise(a)
stopifnot(3 == a.cached(3))

b <- function(x, y, z) {
  return (x + y + z)
}

b.cached <- memoise(b)
stopifnot(6 == b.cached(1, 2, 3))
b.cached <- memoise(b, version=3)
stopifnot(6 == b.cached(1, 2, 3))
