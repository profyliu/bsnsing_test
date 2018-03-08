#!/usr/bin/env Rscript
args = commandArgs(trailingOnly=TRUE)

library(bsnsing)

if(Sys.info()[1] == 'Windows') {
  setwd("C:\\Users\\gn0061\\GoogleDrive\\R_code\\bsnsing_test")
} else setwd("~/bsnsing_test")


load(file = "data/all.RData")

ncases <- length(ds.names)

# test if there is at least one argument: if not, return an error
if (length(args)==0) {
  warning("All data cases will be run.")
  args <- c(1,ncases)
} else if (length(args)==1) {
  # default output file
  args[2] = ncases
}

niter = 5  # number of iterations
nfolds = 2  # number of CV folds

sink(file = paste0("data2/bs_log_",trimws(args[1]), "_", trimws(args[2]), ".txt"), append = T)
# header line
cat(paste(Sys.time()))
cat("\n")
cat("case,n,p,nclass,lambda,nseg,opt.model,node.size,stop.prob,max.rules,mean_accu_test,mean_accu_train,nsample,sd_accu_test,sd_accu_train,mean_seconds,sd_seconds \n")

for (ds in strtoi(args[1]):strtoi(args[2])) {
  
  n <- nrow(eval(parse(text = ds.names[ds])))
  p <- ncol(eval(parse(text = ds.names[ds]))) - 1
  nclass <- nlevels(eval(parse(text = ds.names[ds]))[ , ds.respvar[ds]])
  
  opt.model <- 'mip'
  lambda = 1
  nseg = 10
  num2factor = 5
  #node.size <- max(round(n/nfolds*(nfolds-1)*0.1), 10)
  node.size <- 10
  stop.prob = 0.95
  max.rules = 10
  verbose = F
  
  for(opt.model in c('mip','lp','hybrid')){
    for(node.size in c(5,10,20)){
      for(stop.prob in c(0.8, 0.9, 1)){
        accu_bs <- rep(0, niter*nfolds)
        train_bs <- rep(0, niter*nfolds)
        time_bs <- rep(0, niter*nfolds)
        
        for (rnd in 1:niter) {
          test.folds <- split.k.folds(1:n, nfolds, seed = rnd*2017)
          for (testfd in 1:nfolds) {
            test_index <- test.folds[[testfd]]
            train_index <- setdiff(1:n, test_index)
            
            newdata <- eval(parse(text = ds.names[ds]))[test_index,]
            actual <- eval(parse(text = ds.names[ds]))[test_index, ds.respvar[ds]]
            
            # bsnsing
            systime <- system.time(model_bs <- bsnsing(as.formula(ds.formula[ds]),
                                data = eval(parse(text = ds.names[ds])),
                                subset = train_index,
                                lambda = lambda,
                                nseg.numeric = nseg,
                                opt.model = opt.model,
                                node.size = node.size,
                                stop.prob = stop.prob,
                                max.rules = max.rules,
                                num2factor = num2factor,
                                verbose = verbose))
            time_bs[(rnd - 1)*2 + testfd] <- systime[1]
            pred_bs <- predict(model_bs, newdata, type = 'class')
            if (length(pred_bs) != length(actual)) stop("bsnsing: Predicted and Actual Dimension Mismatch.")
            accu_bs[(rnd - 1)*2 + testfd] <- sum(actual == pred_bs)/length(actual)
            train_actual <- eval(parse(text = ds.names[ds]))[train_index, ds.respvar[ds]]
            train_pred <- predict(model_bs, type = 'class')
            train_bs[(rnd - 1)*2 + testfd] <- sum(train_actual == train_pred)/length(train_actual)
          }
        }
        
        avg_accu_bs <- mean(accu_bs)
        sd_accu_bs <- sd(accu_bs)
        
        avg_train_bs <- mean(train_bs)
        sd_train_bs <- sd(train_bs)
        
        avg_time_bs <- mean(time_bs)
        sd_time_bs <- sd(time_bs)
        
        outtext <- paste(ds.names[ds], n, p, nclass, lambda, nseg, opt.model, node.size, stop.prob, max.rules, avg_accu_bs, avg_train_bs, niter*nfolds, sd_accu_bs, sd_train_bs, avg_time_bs, sd_time_bs, sep = ",")
        
        cat(outtext)
        cat('\n')
      }
    }
  }


}
sink()
