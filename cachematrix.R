## 2 functions below create an object that stores a matrix and caches its inverse.

## function makeCacheMatrix creates "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
      
      invmtr<<-NULL
	  ## set function
      set<-function(y){
            x<<-y
            invmtr<<-NULL
      }
	  ## get function
      get<-function() x
      setInv <- function(inverse) invmtr <<- inverse
      getInv <- function() invmtr
	  ## list of functions 
      list(set = set, get = get,
           setInv = setInv,
           getInv = getInv)
      
}


## Function "cacheSolve" computes the inverse of the special "matrix" returned by "makeCacheMatrix" above. 
## If the inverse has already been calculated (and the matrix has not changed), 
## then the cachesolve should retrieve the inverse from the cache.


cacheSolve <- function(x, ...) {
      ## Return a matrix that is the inverse of 'x'
      inv<-x$getInv()
      if (!is.null(inv)){
            message("getting cached data")
            return(inv)
      }
      dat<-x$get()
      inv<-solve(dat, ...) 
      x$setInv(inv)
      inv
}

 source("cachematrix.R")
 
my_mtr <- makeCacheMatrix(matrix(1:4, 2, 2))
 cacheSolve(my_mtr)
# [,1] [,2]
# [1,]   -2  1.5
# [2,]    1 -0.5
 my_mtr$getInv()
 # [,1] [,2]
 # [1,]   -2  1.5
 # [2,]    1 -0.5
 cacheSolve(my_mtr)
# getting cached data
 # [,1] [,2]
 # [1,]   -2  1.5
 # [2,]    1 -0.5