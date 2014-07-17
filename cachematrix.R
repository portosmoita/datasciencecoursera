## Caching the inverse of a matrix

## This function create a special  matrix object that can cache its inverse
makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setmatrix <- function(solve) m <<- solve
        getmatrix <- function() m
        list(set=set, get=get,
             setmatrix=setmatrix,
             getmatrix=getmatrix)
}

## This function computes the inverse of the special matrix 
## returned by makeCacheMatrix function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        m <- x$getmatrix()
        if(!is.null(m)){
                message("getting cached data")
                return(m)
        }
##matrix is invertible and if the inverse has been calculated 
##Then the cacheSolve function should retrieve the inverse from the cache
        data <- x$get()
        m <- solve(data, ...)
        x$setmatrix(m)
        m
}
