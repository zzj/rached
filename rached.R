memoise <- function(func, version=0, md5=F) {
  new.func <- function(...) {
    parameters = list(...)
    print(names(parameters))
    print(version)
    func(...)
  }
  return (new.func)
}
