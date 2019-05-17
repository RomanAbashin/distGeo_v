## A vectorized version of distGeo (geodesic distance) in R.
## Fully compatible with base R, tidyverse, and data.table.
##
## Adapted from Robert J. Hijmans's implementation of the solution to the inverse geodesic problem.
##
## Author: Roman Abashin
## Date: May 2019
## License: GPL3
## Contact: m@romanabashin.com


vdistGeo <- function(x, y, xx, yy) { 
    if(!"geosphere" %in% installed.packages())  {
        stop("The 'geosphere' package needs to be installed for this function to work.")
    }
    matrix(.Call("_inversegeodesic", 
                 as.double(x), as.double(y), as.double(xx), as.double(yy), 
                 as.double(6378137), 1/298.257223563, PACKAGE='geosphere'), 
           ncol = 3, byrow = TRUE)[,1]
}
