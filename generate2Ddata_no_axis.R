# This script defines functions for generating different 2-dimensional datasets.
#
library(plotrix)

P <- 50  # number of positive cases
N <- 50  # number of negative cases
x1rng <- c(-10,10)  # x1 range of canvas
x2rng <- c(-10,10)  # x2 range of canvas

# Global parameters for the plot
pch.shift = 16
col.shift = 1
cex.lab = 1.5
cex.axis = 1.5
cex.main = 2
cex = 1
cex.sub = 1.5


oblique <- function(P, N, x1rng = x1rng, x2rng = x2rng, seed = 2017) {
  # Generate two classes of points separated by an oblique line
  # Args:
  #   P: number of positive cases
  #   N: number of negative cases
  #   x1rng: vector of two elements, min and max of the x1 range on canvas
  #   x2rng: vector of two elements, min and max of the x2 range on canvas
  # Returns:
  #   A dataframe containing the coordinates (x1, x2) and the class label y (0 or 1)

  x1 <- vector()
  x2 <- vector()
  y <- vector()
  np <- 0
  nn <- 0
  set.seed(seed)
  while(TRUE) {
    a <- runif(1, x1rng[1], x1rng[2])
    b <- runif(1, x2rng[1], x2rng[2])
    if (a < b) {
      if (np < P) {
        x1 <- c(x1, a)
        x2 <- c(x2, b)
        y <- c(y, 1)
        np <- np + 1
      }
    } else {
      if (nn < N) {
        x1 <- c(x1, a)
        x2 <- c(x2, b)
        y <- c(y, 0)
        nn <- nn + 1
      }
    }
    if(np >= P & nn >= N) break
  }
  df <- data.frame(x1 = x1, x2 = x2, y = y)

  with(df, {
    plot(x1,x2, col = (y + col.shift), pch = (y + pch.shift), cex.lab = cex.lab, cex.axis = cex.axis, cex = cex, cex.main = cex.main, xlim = x1rng, ylim = x2rng, main = "Oblique", axes=FALSE, frame.plot=TRUE, xlab = "", ylab = "")
  })
  abline(0, 1, lty = 2)
  return(df)
}

circular <- function(P, N, x1rng = x1rng, x2rng = x2rng, seed = 2017) {
  # Generate two classes of points separated by a circlular boundary
  # Args:
  #   P: number of positive cases
  #   N: number of negative cases
  #   x1rng: vector of two elements, min and max of the x1 range on canvas
  #   x2rng: vector of two elements, min and max of the x2 range on canvas
  # Returns:
  #   A dataframe containing the coordinates (x1, x2) and the class label y (0 or 1)

  x1 <- vector()
  x2 <- vector()
  y <- vector()
  np <- 0
  nn <- 0
  set.seed(seed)
  while(TRUE) {
    a <- runif(1, x1rng[1], x1rng[2])
    b <- runif(1, x2rng[1], x2rng[2])
    if (a*a + b*b <= 36) {
      if (np < P) {
        x1 <- c(x1, a)
        x2 <- c(x2, b)
        y <- c(y, 1)
        np <- np + 1
      }
    } else {
      if (nn < N) {
        x1 <- c(x1, a)
        x2 <- c(x2, b)
        y <- c(y, 0)
        nn <- nn + 1
      }
    }
    if(np >= P & nn >= N) break
  }
  df <- data.frame(x1 = x1, x2 = x2, y = y)

  with(df, {
    plot(x1,x2, col = (y + col.shift), pch = (y + pch.shift), cex.lab = cex.lab, cex.axis = cex.axis, cex = cex, cex.main = cex.main, xlim = x1rng, ylim = x2rng, main = "Circular", axes=FALSE, frame.plot=TRUE, xlab = "", ylab = "")
  })
  draw.circle(0, 0, 6,lty = 2)
  return(df)
}

shape88 <- function(P, N, x1rng = x1rng, x2rng = x2rng, seed = 2017) {
  # Generate two classes of points separated by the shape 88
  # Args:
  #   P: number of positive cases
  #   N: number of negative cases
  #   x1rng: vector of two elements, min and max of the x1 range on canvas
  #   x2rng: vector of two elements, min and max of the x2 range on canvas
  # Returns:
  #   A dataframe containing the coordinates (x1, x2) and the class label y (0 or 1)

  up.center <- 4
  lo.center <- -4
  small.rad <- 3
  big.rad <- 4.5

  x1 <- vector()
  x2 <- vector()
  y <- vector()
  np <- 0
  nn <- 0
  set.seed(seed)
  while(TRUE) {
    a <- runif(1, x1rng[1], x1rng[2])
    b <- runif(1, x2rng[1], x2rng[2])
    if (((a-up.center)^2 + (b - up.center)^2 >= small.rad^2 & (a-up.center)^2 + (b - up.center)^2 <= big.rad^2) |
        ((a-lo.center)^2 + (b - lo.center)^2 >= small.rad^2 & (a-lo.center)^2 + (b - lo.center)^2 <= big.rad^2) |
        ((a-up.center)^2 + (b - lo.center)^2 >= small.rad^2 & (a-up.center)^2 + (b - lo.center)^2 <= big.rad^2) |
        ((a-lo.center)^2 + (b - up.center)^2 >= small.rad^2 & (a-lo.center)^2 + (b - up.center)^2 <= big.rad^2)) {
      if (np < P) {
        x1 <- c(x1, a)
        x2 <- c(x2, b)
        y <- c(y, 1)
        np <- np + 1
      }
    } else {
      if (nn < N) {
        x1 <- c(x1, a)
        x2 <- c(x2, b)
        y <- c(y, 0)
        nn <- nn + 1
      }
    }
    if(np >= P & nn >= N) break
  }
  df <- data.frame(x1 = x1, x2 = x2, y = y)

  with(df, {
    plot(x1,x2, col = (y + col.shift), pch = (y + pch.shift), cex.lab = cex.lab, cex.axis = cex.axis, cex = cex, cex.main = cex.main, xlim = x1rng, ylim = x2rng, main = "Shape88", axes=FALSE, frame.plot=TRUE, xlab = "", ylab = "")
  })
  draw.circle(up.center, up.center, small.rad, lty = 2)
  draw.circle(lo.center, up.center, big.rad, lty = 2)
  draw.circle(up.center, lo.center, small.rad, lty = 2)
  draw.circle(lo.center, lo.center, big.rad, lty = 2)
  draw.circle(up.center, up.center, big.rad, lty = 2)
  draw.circle(lo.center, up.center, small.rad, lty = 2)
  draw.circle(up.center, lo.center, big.rad, lty = 2)
  draw.circle(lo.center, lo.center, small.rad, lty = 2)
  return(df)
}

ringshape <- function(P, N, x1rng = x1rng, x2rng = x2rng, seed = 2017) {
  # Generate two classes of points separated by ring shape
  # Args:
  #   P: number of positive cases
  #   N: number of negative cases
  #   x1rng: vector of two elements, min and max of the x1 range on canvas
  #   x2rng: vector of two elements, min and max of the x2 range on canvas
  # Returns:
  #   A dataframe containing the coordinates (x1, x2) and the class label y (0 or 1)

  x1 <- vector()
  x2 <- vector()
  y <- vector()
  np <- 0
  nn <- 0
  set.seed(seed)
  while(TRUE) {
    a <- runif(1, x1rng[1], x1rng[2])
    b <- runif(1, x2rng[1], x2rng[2])
    if ((a^2 + b^2 >= 5^2 & a^2 + b^2 <= (7.5)^2)) {
      if (np < P) {
        x1 <- c(x1, a)
        x2 <- c(x2, b)
        y <- c(y, 1)
        np <- np + 1
      }
    } else {
      if (nn < N) {
        x1 <- c(x1, a)
        x2 <- c(x2, b)
        y <- c(y, 0)
        nn <- nn + 1
      }
    }
    if(np >= P & nn >= N) break
  }
  df <- data.frame(x1 = x1, x2 = x2, y = y)

  with(df, {
    plot(x1,x2, col = (y + col.shift), pch = (y + pch.shift), cex.lab = cex.lab, cex.axis = cex.axis, cex = cex, cex.main = cex.main, xlim = x1rng, ylim = x2rng, main = "Ring", axes=FALSE, frame.plot=TRUE, xlab = "", ylab = "")
  })
  draw.circle(0, 0, 5, lty = 2)
  draw.circle(0, 0, 7.5, lty = 2)
  return(df)
}

diamond <- function(P, N, x1rng = x1rng, x2rng = x2rng, seed = 2017) {
  # Generate two classes of points separated by a diamond shape
  # Args:
  #   P: number of positive cases
  #   N: number of negative cases
  #   x1rng: vector of two elements, min and max of the x1 range on canvas
  #   x2rng: vector of two elements, min and max of the x2 range on canvas
  # Returns:
  #   A dataframe containing the coordinates (x1, x2) and the class label y (0 or 1)

  x1 <- vector()
  x2 <- vector()
  y <- vector()
  np <- 0
  nn <- 0
  hw <- (x1rng[2] - x1rng[1])/2
  set.seed(seed)
  while(TRUE) {
    a <- runif(1, x1rng[1], x1rng[2])
    b <- runif(1, x2rng[1], x2rng[2])
    if ((a+b) <= hw & (-a-b) <= hw & (a-b) <= hw & (-a+b) <= hw) {
      if (np < P) {
        x1 <- c(x1, a)
        x2 <- c(x2, b)
        y <- c(y, 1)
        np <- np + 1
      }
    } else {
      if (nn < N) {
        x1 <- c(x1, a)
        x2 <- c(x2, b)
        y <- c(y, 0)
        nn <- nn + 1
      }
    }
    if(np >= P & nn >= N) break
  }
  df <- data.frame(x1 = x1, x2 = x2, y = y)

  with(df, {
    plot(x1,x2, col = (y + col.shift), pch = (y + pch.shift), cex.lab = cex.lab, cex.axis = cex.axis, cex = cex, cex.main = cex.main, xlim = x1rng, ylim = x2rng, main = "Diamond", axes=FALSE, frame.plot=TRUE, xlab = "", ylab = "")
  })
  abline(hw, 1, lty = 2)
  abline(hw, -1, lty = 2)
  abline(-hw, 1, lty = 2)
  abline(-hw, -1, lty = 2)
  return(df)
}

grid2x2 <- function(P, N, x1rng = x1rng, x2rng = x2rng, seed = 2017) {
  # Generate two classes of points separated by a diamond shape
  # Args:
  #   P: number of positive cases
  #   N: number of negative cases
  #   x1rng: vector of two elements, min and max of the x1 range on canvas
  #   x2rng: vector of two elements, min and max of the x2 range on canvas
  # Returns:
  #   A dataframe containing the coordinates (x1, x2) and the class label y (0 or 1)

  x1 <- vector()
  x2 <- vector()
  y <- vector()
  n <- N + P
  set.seed(seed)
  x1 <- runif(n, x1rng[1], x1rng[2])
  x2 <- runif(n, x2rng[1], x2rng[2])
  y <- ifelse((x1 < 0 & x2 > 0) | (x1 > 0 & x2 < 0), 1, 0)

  df <- data.frame(x1 = x1, x2 = x2, y = y)

  with(df, {
    plot(x1,x2, col = (y + col.shift), pch = (y + pch.shift), cex.lab = cex.lab, cex.axis = cex.axis, cex = cex, cex.main = cex.main, xlim = x1rng, ylim = x2rng, main = "Grid2x2", axes=FALSE, frame.plot=TRUE, xlab = "", ylab = "")
  })
  abline(h = 0, v = 0, lty = 2)
  return(df)
}

