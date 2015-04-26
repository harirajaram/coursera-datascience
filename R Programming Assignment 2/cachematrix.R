##this program will produce the inverse of a given matrix.
## If the inverse of matrix is available in cache,then the value is returned 
## from cache else the inverse is calculated.

## caches the given matrix i.e the calculated inverse

## how to run examples 1,2,3,4 will show user-friedly errors,5 will show the right result.
## 1) mdat <- matrix(c(1,2, 11,NA), nrow = 2, ncol = 2);cacheSolve(makeCacheMatrix(mdat))
## 2) mdat <- matrix(c(1,2, 11,"1"), nrow = 2, ncol = 2);cacheSolve(makeCacheMatrix(mdat)) 
## 3) mdat <- matrix(c(1,2, 11,"hari"), nrow = 2, ncol = 2);cacheSolve(makeCacheMatrix(mdat))
## 4) mdat <- matrix(c(1,2, 3,4), nrow = 2, ncol = 2);cacheSolve(mdat)
## 5) mdat <- matrix(c(1,2, 3,4), nrow = 2, ncol = 2);cacheSolve(makeCacheMatrix(mdat))

makeCacheMatrix <- function(x = matrix()) {
        ## check if the matrix has any NA values to show userfreindly errors.
        if (any(is.na(x))){
                print("inverse matrix can't be performed for a matrix which are having NA values.")
        }
        ## check if the matrix is non-numeric to show userfreindly errors.
        else if (!is.numeric(x)){
                print("inverse matrix can't be performed for non-numeric matrix.")
        }
        else{
                ## global variable
                inverse<- NULL
                ## set function
                set <- function(y) {
                        x <<- y
                        inverse <<- NULL
                }
                ## get function 
                get <- function() x
                setInverse <- function(solveVariable) inverse <<- solveVariable
                getInverse <- function() inverse
                list(set = set, get = get,
                     setInverse = setInverse,
                     getInverse = getInverse)
        }
        
}


## method used to return the inverse of a given matriz
## check if the value in cache for a given matrix i.e environment return it
## else calculate a new one and store it in cache

cacheSolve <- function(x,...) {
        ## check if makeCacheMatrix is called or there are no errors
        if(is.list(x))
        {    
               ## return the inverse 
                inverse <- x$getInverse()
                if(!is.null(inverse)) {
                        message("getting cached data")
                        return(inverse)
                }
                inverse <- solve(x$get())
                x$setInverse(inverse)
                inverse
        } else { ## if no errors
                print("please make sure makeCacheMatrix is called,if called then fix the above error.")
        }
}


