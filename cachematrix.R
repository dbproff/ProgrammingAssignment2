## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {

}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}
## 2 functions below create an object that stores a matrix and caches its inverse.

## function makeCacheMatrix creates "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
      
      invmtr<<-NULL
      set<-function(y){
            x<<-y
            invmtr<<-NULL
      }
      get<-function() x
      setInverse <- function(inverse) invmtr <<- inverse
      getInverse <- function() invmtr
      list(set = set, get = get,
           setInverse = setInverse,
           getInverse = getInverse)
      
}


## Function "cacheSolve" computes the inverse of the special "matrix" returned by "makeCacheMatrix" above. 
## If the inverse has already been calculated (and the matrix has not changed), 
## then the cachesolve should retrieve the inverse from the cache.


cacheSolve <- function(x, ...) {
      ## Return a matrix that is the inverse of 'x'
      inv<-x$getInverse()
      if (!is.null(inv)){
            message("getting cached data")
            return(inv)
      }
      dat<-x$get()
      inv<-solve(dat, ...) 
      x$setInverse(inv)
      inv
}

 source("cachematrix.R")
 
my_mtr <- makeCacheMatrix(matrix(1:4, 2, 2))
 cacheSolve(my_mtr)
# [,1] [,2]
# [1,]   -2  1.5
# [2,]    1 -0.5
 my_mtr$getInverse()
 # [,1] [,2]
 # [1,]   -2  1.5
 # [2,]    1 -0.5
 cacheSolve(my_mtr)
# getting cached data
 # [,1] [,2]
 # [1,]   -2  1.5
 # [2,]    1 -0.5