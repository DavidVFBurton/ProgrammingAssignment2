Cache Matrix - R Programming Project
==

Program Summary
--

File: cachemartix.R

The cache matrix program takes a given square matrix and caches it for later use.

The program consists of two functions: makeCacheMatrix and cacheSolve

### makeCacheMatrix

This function receives a parm **x** in the form of a matrix

```{r}
makeCacheMatrix <- function(x = matrix()) { ... }
```

The function stores the matrix in a variable named: **CacheMatrix**

When called, it returns a list of four functions:

```{r}
  set <- function(mtrx) {
    x <<- mtrx
    CacheMatrix <<- NULL
  }
  
  get <- function() {
    x
  }
  
  setMatrix <- function(parmMatrtix) {
    CacheMatrix <<- parmMatrtix
  }
  
  getMatrix <- function() {
    CacheMatrix
  }
```

These functions are responsible for getting and setting the matrix.

See usage below...

### cacheSolve

This function received a parm in the form of the variable set by makeCacheMatrix.

```{r}
cacheSolve <- function(x, ...) { ... }
```

The function attempts to recall the inverse of the matrix from cache, if there is no cached matrix then the current copy of the matrix is used.

```{r}
if(!is.null(m)) {
  message("getting cached data")
  return(m)
}
```

cacheSolve then computes the inverse of the matrix, stores it in cache and returns the matrix inverse to the caller.

```{r}
Martx <- x$get()
m <- solve(Martx)
x$setMatrix(m)
```

The inverse is calculated through the solve function and cached through the setMatrix function.


The program has been tested with exceptionally large matrices with no issues.
The maximum test data used was a 10,000 by 10,000 matrix with 100,000,000 random normal values.

The processing time was approximately 50 minutes.



Program usage
--

```
Notice: as per instructions in the assessment, you should not execute the code, the following is simply documentation.
```

```{r}
makeCacheMatrix <- function(x = matrix()) { ... }

  Input: x as Matrix
  
  Return Data: List of functions.
      set <- function(mtrx)
        Sets the unaltered matrix to variable x.
        
      get <- function()
        Gets the unaltered matrix from variable x.
        
      setMatrix <- function(parmMatrtix)
        sets the inverse of the matrix to cache.
        
      getMatrix <- function()
        Gets the inverse of the matrix from cache.
        
      
      
      
  Example:  mtx <- makeCacheMatrix(matrix(rnorm((100),mean=30,sd=15),nrow=10,ncol=10))
            mtx$get()
            mtx$getMatrix()
      
```
```{r}
cacheSolve <- function(x, ...)

  Input: x as Special Matrix (mtx from above)
  
  Return Data: Inverse of a matrix.
  
  Example:  cacheSolve(mtx)
```

### Usage Walk Through
To create a cached matrix, you must pass a matrix into the **makeCacheMatrix** function as follows.

```{r}
mtx <- makeCacheMatrix(matrix(rnorm((100),mean=30,sd=15),nrow=10,ncol=10))
```

This will assign a special matrix to the variable **mtx**

Issuing the command **mtx$get()** will return the newly created matrix.

```
Note: At this point, the Matrix is not cached.
```

The mtx$get() function will return the matrix you just created and should look close to the following:

```
          [,1]       [,2]     [,3]     [,4]      [,5]     [,6]      [,7]     [,8]      [,9]    [,10]
 [1,] 24.29789  17.062503 47.41936 32.60818 -7.302432 32.88457 32.739595 29.83809 38.786979 19.43026
 [2,] 17.99462 -25.640552 49.52373 20.73525 55.339528 16.33025 10.396248 46.29723 -1.615583 13.79480
 [3,] 58.71407  27.017516 24.21103 16.20459 31.083547 39.28976 57.224393 21.72375 22.794716 21.17260
 [4,] 21.33272  57.359983 22.86469 23.19321 48.122983 22.85303 15.449594 41.33427 36.260918 25.29015
 [5,] 28.46514   2.159673  6.31922 15.82073 25.806569 44.88497 45.586976 23.10771 56.907247 11.60198
 [6,] 50.27980  59.625755 30.05129 17.93570 37.473884 45.43572  5.443458 32.47120 25.630567 29.30059
 [7,] 34.45558  34.708515 48.91429 15.85080 18.341038 44.59141 50.779753 31.89015 17.705675 25.21667
 [8,] 45.23780  35.888506 76.77009 17.23989 47.647925 31.66255  9.365575 18.70278 14.760311 31.23032
 [9,] 31.34041  53.093229 36.97993 48.71025 41.685210 41.63469 49.729815 40.86322 57.939357 18.34632
[10,] 19.27413  15.088363 30.32551 32.85648 22.426049 34.73623 30.700219 42.78975 39.257928 53.81062
```

Since we have not cached the matrix yet, issuing the following command should return NULL.

```
> mtx$getMatrix()
NULL
> 
```

Notice above, I used **mtx$get()** to return the matrix, if I simply used **mtx** I would have returned the list of functions assigned to mtx as follows:

```{r}
> mtx
$set
function (mtrx) 
{
    x <<- mtrx
    CacheMatrix <<- NULL
}
<environment: 0x000000001f231478>

$get
function () 
{
    x
}
<environment: 0x000000001f231478>

$setMatrix
function (parmMatrtix) 
CacheMatrix <<- parmMatrtix
<environment: 0x000000001f231478>

$getMatrix
function () 
{
    CacheMatrix
}
<environment: 0x000000001f231478>
```

So, instead I called the function $get to return it.  Which, as you can see, is the second function in the list.  It simply returns the matrix **x**


We can now solve the matrix and cache the inverse by issuing the following command:
```{r}
cacheSolve(mtx)

## You can also assign the result to a variable

cmtx <- cacheSolve(mtx)

## But now you have two copies of the matrix in memory.
## The cached inverse can now be displayed like this:

mtx$getMatrix()
```

What has happened here is that the following code has been executed to calculate the inverse and cache the inverse matrix.

```{r}
Martx <- x$get()
m <- solve(Martx)
x$setMatrix(m)
```

This is why we can now use the **mtx$getMatrix()** command.  The resulting inverse matrix should look close to the following:

```
This is a wide data set, you may have to maximize the window to see it as a normal table.

              [,1]          [,2]          [,3]          [,4]         [,5]         [,6]          [,7]          [,8]         [,9]         [,10]
 [1,]  0.022294249  0.0024029886  0.0292198239  0.0093276482 -0.004703520  0.005085173 -0.0261102474 -0.0014032704 -0.016262226 -0.0077071643
 [2,] -0.002348996 -0.0070592780 -0.0022950518  0.0087080250 -0.006651755  0.001175870  0.0080688208 -0.0009293962  0.003422379 -0.0041464646
 [3,]  0.010515626 -0.0004213785 -0.0058715871  0.0072872017  0.002024793 -0.011046001  0.0053934542  0.0131953268 -0.006550544 -0.0071778442
 [4,] -0.011303218  0.0050221517  0.0002342423 -0.0422489747 -0.021234345  0.015308246 -0.0148761430 -0.0055092603  0.044813098  0.0136908908
 [5,] -0.022305287  0.0032985197 -0.0031433795 -0.0033050878  0.004933486 -0.003507658  0.0001857709  0.0081063379  0.011459129  0.0021462683
 [6,] -0.026990894  0.0024792051 -0.0308417322 -0.0439880635  0.011115503  0.030495685  0.0271998648 -0.0054114192  0.022679880  0.0055791760
 [7,] -0.005618171 -0.0029893857  0.0101117572  0.0055466926 -0.002071225 -0.018035773  0.0121063770 -0.0013728599  0.002349524  0.0007992439
 [8,]  0.024888207  0.0130358634  0.0046219587  0.0316968733 -0.001910545  0.002171383  0.0031549325 -0.0209320358 -0.025614312 -0.0104116988
 [9,]  0.018724507 -0.0069455408  0.0009270473  0.0250108339  0.018188976 -0.013472928 -0.0157279090  0.0095072157 -0.016892101 -0.0060736832
[10,] -0.009878211 -0.0082787424  0.0044419479 -0.0009360218 -0.004426053 -0.005104703 -0.0024434515  0.0072977970 -0.006870357  0.0259509178
```

Now we will check if everything worked properly by testing the cached inverse matrix to the original using the solve function.

mtx$getMatrix() will return the cached inverse of the matrix and mtx$get() will return the original matrix.

```{r}
mtx$getMatrix() == solve(mtx$get())
      [,1] [,2] [,3] [,4] [,5] [,6] [,7] [,8] [,9] [,10]
 [1,] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE  TRUE
 [2,] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE  TRUE
 [3,] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE  TRUE
 [4,] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE  TRUE
 [5,] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE  TRUE
 [6,] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE  TRUE
 [7,] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE  TRUE
 [8,] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE  TRUE
 [9,] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE  TRUE
[10,] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE  TRUE
```

Well, looks like everything is TRUE and good.

This should demonstrate that my code does indeed work as advertised.

Thank You
