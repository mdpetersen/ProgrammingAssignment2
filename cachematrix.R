## The following functions calculate and cache the inverse of a matrix

## Creates a special matrix object that can cache its inverse,
## with the following methods
## 1. Set the value of the matrix
## 2. Get the value of the matrix
## 3. Set the value of the inverse
## 4. Get the value of the inverse

makeCacheMatrix <- function( m = matrix() ) {
  
  ## Initialize the inverse 
  inv <- NULL
  
  ## 1. Set the value of the matrix
  set <- function( matrix ) {
    m <<- matrix
    inv <<- NULL
  }
  
  ## 2. Get the value of the matrix
  get <- function() {
    ## Return the matrix
    m
  }
  
  ## 3. Set the value of the inverse
  setInv <- function(inverse) {
    inv <<- inverse
  }
  
  ## 4. Get the value of the inverse
  getInv <- function() {
    ## Return the inverse 
    inv
  }
  
  ## Return a list of the methods
  list(set = set, get = get,
       setInv = setInv,
       getInv = getInv)
}


## Computes the inverse of the special "matrix" returned by makeCacheMatrix above.
## If the inverse has already been calculated (and the matrix has not changed), 
## then the cachesolve should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
  
  ## Return a the inverse of "x"
  m <- x$getInv()
  
  ## Checks if there is cache data
  if( !is.null(m) ) {
    message("getting cached data")
    return(m)
  }
  
  ## Get the matrix
  matrix <- x$get()
  
  ## Calculate the inverse using solve function
  m <- solve(matrix) %*% matrix
  
  ## Set the inverse to the object
  x$setInv(m)
  
  ## Return the matrix
  m
}

