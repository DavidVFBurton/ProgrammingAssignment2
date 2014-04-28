## Assignment: Caching the Inverse of a Matrix

## The functions in this file deal with caching and returning a matrix.
## The first function "makeCacheMatrix" is used to cache a matrix (x)
## the second function "cacheSolve" returns the inverse of the matrix.



## See README.md in the github repo for program run and output data.

## Function makeCacheMatrix takes a matrix as input and creates a special matrix
## A list of functions are returned allowing saving and retrieving of the matrix
## See README.md in the github repo for more details.


makeCacheMatrix <- function(x = matrix()) {
  
  ## initialize the CacheMatrix variable
  CacheMatrix <- NULL
  
  ## Sets the unaltered matrix to x in the parent environment
  set <- function(mtrx) {
    x <<- mtrx
    CacheMatrix <<- NULL
  }
  
  ## Gets the unaltered matrix from x.
  get <- function() {
    x
  }
  
  ## Caches a matrix to CacheMatrix in the parent environment
  setMatrix <- function(parmMatrtix) { 
    CacheMatrix <<- parmMatrtix
  }
  
  
  ## Retrieves the cached matrix from CacheMatrix. 
  getMatrix <- function() {
    CacheMatrix
  }
  
  ## Returned function list.
  list(set = set, get = get,
       setMatrix = setMatrix,
       getMatrix = getMatrix)
  
  
}


## Function cacheSolve returns the inverse of a special matrix created using makeCacheMatrix.
## This function accepts a variable containing the output from makeCacheMatrix.
## This function performs calls to makeCacheMatrix in order to cache and retrieve data.
## The solve function is used to calculate the inverse of the matrix.

cacheSolve <- function(x, ...) {
  
  ## Return a matrix that is the inverse of 'x'
  m <- x$getMatrix()
  
  ## Checks if matrix exists and returns the cache version
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  
  ## Get the unaltered copy of the matrix
  Martx <- x$get()
  
  ## Calculate the inverse of the matrix
  m <- solve(Martx)
  
  ## Cache the results of the Solve function
  x$setMatrix(m)
  message("solving")
  
  
  ## Return the inverse matrix
  m
  
}
