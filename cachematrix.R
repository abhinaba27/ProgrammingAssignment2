## Below two functions create a special object that stores a matrix and caches its inverse
## and demonstrate the use of lexical scoping in context of R programming



## This function creates a special matrix object that can cache its inverse

makeCacheMatrix <- function(x=matrix()){
			## Create a special matrix object 'x'

			i<-NULL		
			setmat<-function(y){
				x<<-y
				i<<-NULL
			}
			getmat<-function() x
			setmatinv<-function(inverse) i<<-inverse
			getmatinv<-function() i

			## list of four methods/functions to store and retrieve value of 'x' and its inverse 'i'
			list(setmat=setmat, getmat=getmat, setmatinv=setmatinv, getmatinv=getmatinv)
			
}

## This function computes inverse for the special matrix object created by above function


cacheSolve <- function(x,...){
		## Return a matrix that is the inverse of 'x'
		
		i<-x$getmatinv()
		if(!is.null(i)){
			message("getting cached data")
			return(i)
		}
		data<-x$getmat()
		i<-solve(data)
		x$setmatinv(i)
		i

}
			

