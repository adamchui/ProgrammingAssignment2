## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setInverse <- function(Inverse) m <<- Inverse
  getInverse <- function() m
  list(set = set, get = get,
       setInverse = setInverse,
       getInverse = getInverse)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m <- x$getInverse()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setInverse(m)
  m  
}


## run by example
#source("cachematrix.R")

# Randomly generate a 10x10 matrix
test_matrix = replicate(10, rnorm(10)) 

# Create a Matrix Cache
Mcache <- makeCacheMatrix(test_matrix)
#Set the Inverse Matrix in the Matrix Cache
Mcache$setInverse(cacheSolve(Mcache))

Mcache$get()
Mcache$getInverse()