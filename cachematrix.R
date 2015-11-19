## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {

    inve <- NULL
    
    set <- function(y) {
        x <<- y
        inve <<- NULL
    }

    get <- function() x

    set_inve <- function(mat_inve) inve <<- mat_inve

    get_inve <- function() inve

    list( set=set, get=get, set_inve=set_inve, get_inve=get_inve )

}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'

    inve <- x$get_inve()

    if(!is.null(inve)) {
        message("getting cached data")
        return(m)
    }

    data <- x$get()
    inve <- solve(data, ...)
    x$set_inve(inve)
    inve

}
