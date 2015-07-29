## The objective of the two functions is to provide with cached value for the
## inverse of the matrix and cache it if not already present.

## The makeCacheMatrix function returns a list comprising of functions to set
## and return the values of the original matrix and it's inverse correspondingly.
## The set() and get() functions set and return the matrix variable x.
## The setmean() and getmean() functions set and return the value of the inverse
## of the matrix x, stored as inverse_x, which is also initialized to NULL in the
## start.


makeCacheMatrix <- function(x = matrix()) {
  
  ## Initialized to NULL
  inverse_x <- NULL
  
  ## Set the matrix x as y and inverse_x as NULL
  set <- function(y){
    x <<- y
    inverse_x <<- NULL
  }
  
  ## Returns the value of matrix x
  get <- function() x
  
  ## Sets the value of inverse of the matrix in inverse_x
  setinverse <- function(inverse) inverse_x <<- inverse
  
  ## Returns the value of the inverse matrix, inverse_x
  getinverse <- function() inverse_x
  
  ## The list with all the above defined functions is returned
  list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
  
}


## The cacheSolve function first checks if any cached value of the inverse of the
## matrix is present or not. If present, it's value is simply returned otherwise
## the inverse of the matrix is computed using the solve function and cached back
## into the matrix object created by the makeCacheMatrix() function.

cacheSolve <- function(x, ...) {
  
  ## First inverse of the matrix is fetched using getinverse() function.
  inverse_x <- x$getinverse()
  
  ## If the value received is not NULL, it's value is returned.
  if(!is.null(inverse_x)){
    message('using the cached data')
    return(inverse_x)
  }
  
  ## Since the value received was NULL, we now compute thr inverse.
  ## First we get the original matrix from the special object.
  real_x <- x$get()
  
  ## The inverse of the object is computed using the solve() function.
  inverse_x <- solve(real_x, ...)
  
  ## The inverse of the matrix is set using the setinverse() function and returned.
  x$setinverse(inverse_x)
  
  inverse_x
}
