## makeCacheMatrix is a list of functions that will cache the inverse of matrix (x)

## The setMatrix function sets the matrix, which is then retrived by the getMatrix function. The inverse of this matrix is then calculated using setinvMatrix and returned using getinvMatrix

makeCacheMatrix <- function(x = matrix()) {
    invMatrix <- NULL
    setMatrix <- function(y) {
        x <<- y
        invMatrix <<- NULL
    }
    getMatrix <- function() x
    
    setinvMatrix <- function(inverse) invMatrix <<- inverse
    getinvMatrix <- function() invMatrix
    
    list(set = set, get = get,
    setinvMatrix = setinvMatrix,
    getinvMatrix = getinvMatrix)
}


## CacheSolve computes the inverse matrix (x) returned by the makeCacheMatrix function using the solve function. If the inverse has already been calculated, CacheSolve will retrieve the invMatrix from the cache.

cacheSolve <- function(x, ...) {
    invMatrix <- x$getinvMatrix()
    
    # If the inverse is already calculated, return it
    if (!is.null(invMatrix)) {
        message("getting cached data")
        return(inv)
    } else {
        
        # If not, then the matrix is inverted using the solve function
        invMatrix <- solve(x$getinvMatrix())
        
        x$setinvMatrix(invMatrix)
        return(invMatrix)
    }
}
