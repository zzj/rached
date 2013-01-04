source('rached.R')
rached.clear()


## a function to make sure each function is only called once.
called.funcs <- new.env()
called <- function(name) {
  stopifnot(!exists(name, called.funcs, inherits=F))
  assign(name, T, called.funcs, inherits=F)
}

a <- function(b) {
  called('a')
  return(b)
}
a.cached <- rached.memoise(a, 'a')
a.cached <- rached.memoise(a, 'a')

stopifnot(3 == a.cached(3))

b <- function(x, y, z) {
  called('b')
  return (x + y + z)
}
b.cached <- rached.memoise(b, 'b')

stopifnot(6 == b.cached(1, 2, 3))
stopifnot(6 == b.cached(1, 2, 3))


c <- function(x) {
  return (x)
}
c.cached <- rached.memoise(c, 'c')

filename <- "a/b/c"
stopifnot(filename == c.cached(filename))
stopifnot(filename == c.cached(filename))
