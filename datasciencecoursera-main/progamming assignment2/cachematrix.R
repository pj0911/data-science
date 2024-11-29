## Put comments here that give an overall description of what your
## functions do
# These functions create a special "matrix" object that can cache its inverse.
# This is helpful to avoid recalculating the inverse of a matrix multiple times,
# which can be computationally expensive.

## Write a short comment describing this function
# makeCacheMatrix creates a special "matrix" object that can cache its inverse.
# It includes functions to set and get the matrix, as well as set and get the cached inverse.

makeCacheMatrix <- function(x = matrix()) {
    inv <- NULL  # Initialize the inverse as NULL
    set <- function(y) {
        x <<- y
        inv <<- NULL  # Reset the inverse when a new matrix is set
    }
    get <- function() x  # Return the matrix
    setinverse <- function(inverse) inv <<- inverse  # Set the inverse
    getinverse <- function() inv  # Get the cached inverse
    list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}

## Write a short comment describing this function
# cacheSolve computes the inverse of the special "matrix" returned by makeCacheMatrix.
# If the inverse has already been calculated (and the matrix has not changed),
# it retrieves the inverse from the cache.

cacheSolve <- function(x, ...) {
    inv <- x$getinverse()  # Retrieve the cached inverse
    if (!is.null(inv)) {  # If the inverse is already cached
        message("getting cached data")
        return(inv)  # Return the cached inverse
    }
    data <- x$get()  # Get the matrix
    inv <- solve(data, ...)  # Compute the inverse
    x$setinverse(inv)  # Cache the inverse
    inv  # Return the inverse
}
