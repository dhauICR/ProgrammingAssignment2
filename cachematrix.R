##e4eed4153bd237a2dd4532fc3f40ce0e22fd0cb7

## The functions create an inverse matrix that's contents are then cached.


## A matrix is created which contains a list of functions that set the value 
##and then get the value of the matrix and the inverse of the matrix. 

makeCacheMatrix <- function(x = matrix()) {
	m <- NULL
	set <- function(y) {
		x <<- y
		m <<- NULL
	}
	get <- function()x
	setsolve <- function(solve) m <<- solve
	getsolve <- function() m
	list(set = set, get = get,
		setsolve = setsolve ,
		getsolve = getsolve )
}


## The inverse of the matrix is calculated using the cached version 
## from the function above

cacheSolve <- function(x, ...) {
	m <- x$getsolve()
	if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setsolve(m)
        m        ## Return a matrix that is the inverse of 'x'
}
