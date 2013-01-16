
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

rached.legalize.filename <- function(k) {
  gsub("/",".",k)
}


rached.key <- function(name, version, md5, ...) {
  parameters = list(...)
  k <- paste(name, version, paste(names(parameters), collapse="-"),
             paste(parameters, collapse="-"), sep=":")
  return(k)
}

rached.file <- function(name, version, md5, ...) {
  k <- rached.key(name, version, md5, ...)
  legal.k <- rached.legalize.filename(k)
  paste(rached.folder, "/", legal.k, ".rds", sep="")
}

rached.memoise <- function(func, name, version=0, md5=F) {
  new.func <- function(...) {
    data.file <- rached.file(name, version, md5, ...)
    if (!file.exists(data.file)) {
      ret <- func(...)
      saveRDS(ret, data.file)
      ## remove old cached data
      if (version > 0) {
        old.data.file <- rached.file(name, version - 1, md5, ...)
        if (file.exist(old.data.file)) {
          unlink(old.data.file)
        }
      }
    }
    else {
      ret <- readRDS(data.file)
    }
    return (ret)
  }
  return (new.func)
}
