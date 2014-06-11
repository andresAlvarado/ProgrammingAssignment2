# I have created to functions as the example given. 
# solve calculates inverse matrix for the matrix given by the user.

# Make Matrix has functions to set and get values for 
# inverse matrix and matrix given by the user.
# It also returns a list so that any other object is 
# able to use such functions.

makeMatrix <- function( p_matrix = matrix() )
{
  # Local Inverse Matrix
  
  l_inverseMatrix <- NULL
  
  #Set matrix and inverseMatrix in a different environment. 
  
  setMatrix <- function( c_matrix )
  {
    p_matrix        <<- c_matrix
    l_inverseMatrix <<- NULL
  }
  
  # Get Matrix
  
  getMatrix <- function()
  {
    p_matrix    
  }
  
  # Set Inverse Matrix
  
  setInverseMatrix <- function(p_inverseMatrix,..)
  {
    l_inverseMatrix <<- p_inverseMatrix
    
  }
  
  # Get Inverse Matrix
  
  getInverseMatrix <- function()
  {
    l_inverseMatrix
  }
  
  # Return a list of functions so that get and set functions 
  # are available from other functions.
  
  list( mcm.setMatrix        = setMatrix
      , mcm.getMatrix        = getMatrix
      , mcm.setInverseMatrix = setInverseMatrix
      , mcm.getInverseMatrix = getInverseMatrix
  ) 
  
} 


# cacheSolve function will make use of solve
# function, aswell as the list returned by makeMatrix
# function

cacheSolve <- function(x, ...) 
{
  
  # See if an inverse matrix for matrix given already exists in an environment
  l_inverseMatrix <- x$mcm.getInverseMatrix()
  
  # If so, return its inverse
  if( ! is.null(l_inverseMatrix)   )
  {
    print("Getting Cached Inverse Matrix")
    return(l_inverseMatrix)
  }
  
  #Else, get inverse matrix for matrix given
  print("Setting matrix")
  
  #Get matrix given
  matrix <- x$mcm.getMatrix()
  
  #Get inverse matrix
  l_inverseMatrix <- solve(matrix)
  
  #Set Inverse Matrix  
  x$mcm.setInverseMatrix(l_inverseMatrix)
  
  #Return Inverse Matrix
  return(l_inverseMatrix)
  
}
