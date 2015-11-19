## Matrix inversion is a computationally intensive problem. Some times, we will 
## find situations in which we need to use the inverse of a matricial variable, 
## and this variable might or might not change. In those cases, it might be 
## advantageous to store a cache of the matrix inverse alongside the original 
## matrix, and only re-calculate the inverse if the original matrix has changed.
## In this file, I create such an object and the functions to interact with it.

## The function makeCacheMatrix creates and object consisting on a matrix, x, 
## its inverse, inve, and the functions to interact with them: set, that 
## assigns the value of x, get, that retrieves its value, set_inve, that 
## assigns the value of the matrix inverse, and get_inve, that retrieves the 
## value of the matrix inverse. Each time the matrix x changes, inve is set to 
## NULL.

makeCacheMatrix <- function(x = matrix()) {

    ## Inverse of the original matrix.
    inve <- NULL

    ## Function used to modify the value of the matrix x. Each time it is 
    ## modified, we also assign the value NULL to the inverse.
    set <- function(y) {
        x <<- y
        inve <<- NULL
    }

    ## Function used to retrieve the value of the matrix x.
    get <- function() x

    ## Function used to set the value of the matrix inverse.
    set_inve <- function(mat_inve) inve <<- mat_inve

    ## Function used to retrieve the value of the matrix inverse.
    get_inve <- function() inve

    ## The output of the function is a list whose elements are the functions 
    ## used to interact with the original matrix and the matrix inverse.
    list( set=set, get=get, set_inve=set_inve, get_inve=get_inve )

}


## The function cacheSolve accepts an invertible matrix x, and a set of optional 
## arguments for the solve function, and it outputs the inverse of the matrix 
## x. It checks if the inverse has already been calculated, and the matrix has 
## not changed. If so, it returns the cached value for the matrix inverse. If 
## either the inverse is not available or the matrix has changed, then the 
## inverse is calculated.

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'

    ## Retrieve the inverse matrix stored in the object x.
    inve <- x$get_inve()

    ## Check if the inverse matrix is available, and if the matrix x has not 
    ## changed after the inverse was calculated. If so, return the cached value.
    if(!is.null(inve)) {
        message("getting cached data")
        return(m)
    }

    ## If either the inverse has not previously been calculated, or the matrix 
    ## x has changed since then, calculate the matrix inverse and return it..
    data <- x$get()
    inve <- solve(data, ...)
    x$set_inve(inve)
    inve

}
