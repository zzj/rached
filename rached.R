
rached.folder <- "temp.folder/"

rached.initialize <- function() {
  if (!file.exists(rached.folder)) {
    dir.create(rached.folder)
  }
}

rached.clear <- function() {
  unlink(paste(rached.folder, "*", sep=""))
}

rached.initialize()

rached.memoise <- function(func, name, version=0, md5=F) {
  key <- function(name, version, md5, ...) {
    parameters = list(...)
    k <- paste(name, version, paste(names(parameters), collapse="-"),
               paste(parameters, collapse="-"), sep=":")
    return(k)
  }
  new.func <- function(...) {
    k <- key(name, version, md5, ...)
    data.file <- paste(rached.folder, "/", k, ".rds", sep="")
    if (!file.exists(data.file)) {
      ret <- func(...)
      saveRDS(ret, data.file)
    }
    else {
      ret <- readRDS(data.file)
    }
    return (ret)
  }
  return (new.func)
}
