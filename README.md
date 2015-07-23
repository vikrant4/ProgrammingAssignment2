# Introduction

This solution for the programming assignment 2 for the course `R Programming` 
has been written by [Vikrant Yadav](https://github.com/vikrant4/). As requirerd by the second programming assignmet, two functions have been created to cache and compute the inverse of a matrix, namely `makeCacheMatrix` and `cacheSolve`. The `makeCacheMatrix` function can cache the inverse of a matrix which can later be used to save computation time. The `cacheSolve` function uses the cached data if present, or else computes the inverse of the matrix and caches it back using the functions provided by the `makeCacheMatrix`.

------

### makeCacheMatrix : Creating the special matrix

The first function, `makeCacheMatrix` creates a special "matrix", which is
really a list containing functions to

1.  set the value of the matrix
2.  get the value of the matrix
3.  set the value of the inverse of the matrix
4.  get the value of the inverse of the matrix

<!-- -->

    makeCacheMatrix <- function(x = matrix()) {
      inverse_x <- NULL
      
      set <- function(y){
        x <<- y
        inverse_x <<- NULL
      }
      
      get <- function() x
      
      setinverse <- function(inverse) inverse_x <<- inverse
      
      getinverse <- function() inverse_x
      
      list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
    
    }

------

### cacheSolve : Caching the inverse of the matrix

The `cacheSolve` function aim to reduce the computation time for the costy matrix inversion. `cacheSolve` first checks if the inverse of the matrix is already present in the special matrix object created in the `makeCacheMatrix`. If the inverse has already been computed, then it doesn't have to compute it again and can use the cached value instead. Otherwise, it computes the inverse of the matrix using the `solve` function and caches it back into the special mtrix object using the `setinverse` function.


    cacheSolve <- function(x, ...) {
      inverse_x <- x$getinverse()
      
      if(!is.null(inverse_x)){
        message('using the cached data')
        return(inverse_x)
      }
      
      real_x <- x$get()
      
      inverse_x <- solve( real_x, ...)
      
      x$setinverse(inverse_x)
      
      inverse_x
      
    }