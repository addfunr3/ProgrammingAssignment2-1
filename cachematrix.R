## As inversion  can be a difficult process, there is a benefit to storing it 
## rather than calculating it repeatedly. 
## These functions are used to cache the inverse of a matrix.

## makeCacheMatrix is used to:
## 1. Set and Get a Matrix
## 3. Set and Get the Inverse

makeCacheMatrix <- function(x = matrix()) {
	inv <- NULL
## Sets the inverse to NULL.

	set <- function(y) {
		x <<- y
		inv <<- NULL
	}
## Sets the matrix (defined in the arguments) as y.

	get <- function() x
## Gets the matrix.

	setinverse <- function(inverse) inv <<- inverse
# Sets the inverse of the matrix.
	getinverse <- function() inv
#Returns the inverse of the matrix, if it exists.
	list(set=set, get=get, setinverse=setinverse, getinverse=getinverse)
#Creates a list based on the above outputs.
}

## Searches for whether there is an inverse already stored (and displays it),
## otherwise it calculates the inverse and stores it for potential retrieval later.

cacheSolve <- function(x, ...) {
	inv <- x$getinverse()
## Finds getinverse(from the list) and stores as inv.

	if(!is.null(inv)) {
		message("getting cached data.")
		return(inv)
	}
## Searches for whether there is an inverse already computed (!is.na) and 
## displays it if it exists.

	data <- x$get()
## Sets the matrix from get as the object data.

  inv <- solve(data)
## Calculates the inverse of the matrix.

	x$setinverse(inv)
##Returns the inverse found in Setinverse

	inv
##Prints the inverse.
}

## Data I used for testing.
## x = rbind(c(4, 3), c(3, 2))
## m = makeCacheMatrix(x)
## m$get()
## cacheSolve(m)
