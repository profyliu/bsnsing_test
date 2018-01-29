env <- openEnvCPLEX()
prob <- initProbCPLEX(env)
chgProbNameCPLEX(env, prob, "sample")

cplex.nc <- 4
cplex.nr <- 3
cplex.nz <- 9
cplex.obj <- c(1,2,3,1)
cplex.rhs <- c(20,30,0)
cplex.sense <- c("L", "L", "E")
cplex.lb <- c(0,0,0,2)
cplex.ub <- c(40, CPX_INFBOUND, CPX_INFBOUND, 3)
cplex.beg <- rep(0, p)
cplex.cnt <- rep(0, p)
cplex.ind <- c()
cplex.val <- rep(1, cplex.nz)
for (j in 1:p) {
  cplex.cnt[j] <- sum(bx[,j])  # number of nonzeros in the column
  if (j == 1) {
    cplex.beg[j] <- 0
  } else {
    cplex.beg[j] <- cplex.beg[j-1] + cplex.cnt[j-1]
  }
  cplex.ind <- c(cplex.ind, which(bx[,j] != 0) - 1)
}
cplex.ctype <- rep("C", p + n)
cplex.ctype[int.vec] <- "I"

print(cplex.beg)
print(cplex.cnt)
print(cplex.ind)
print(cplex.val)
print(cplex.nc)
print(cplex.nr)
print(length(cplex.beg))
print(length(cplex.cnt))
print(length(cplex.ind))
print(length(cplex.val))
cplexAPI::copyLpCPLEX(env = cplex.env, lp = cplex.prob, nCols = cplex.nc, nRows = cplex.nr,
                      lpdir = cplexAPI::CPX_MIN,
                      objf = cplex.obj, rhs = cplex.rhs, sense = cplex.sense,
                      matbeg = cplex.beg, matcnt = cplex.cnt, matind = cplex.ind, matval = cplex.val,
                      lb = cplex.lb, ub = cplex.ub)
