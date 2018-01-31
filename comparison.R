library(bsnsing)
library(rpart)
library(party)
library(mlbench)
library(C50)

setwd("C:\\Users\\gn0061\\Google Drive\\R_code\\bsnsing_test")

load(file = "data/all.RData")


testUCImean <- data.frame(dsname = character(), bs_train = numeric(), bs_accu = numeric(), rp_accu = numeric(), ct_accu = numeric(), c5_accu = numeric())

testUCIsd <- data.frame(dsname = character(), bs_train_sd = numeric(), bs_accu_sd = numeric(), rp_accu_sd = numeric(), ct_accu_sd = numeric(), c5_accu_sd = numeric())


for (ds in 1:length(ds.names)) {

  n <- nrow(eval(parse(text = ds.names[ds])))

  k.round = 5
  k.test = 2
  lambda = 1
  nseg = 10
  num2factor = 5
  opt.model <- 'mip'
  #node.size <- max(round(n/k.test*(k.test-1)*0.1), 10)
  node.size <- 10
  stop.prob = 0.95
  max.rules = 10
  verbose = F

  accu_rp <- rep(0, k.round*k.test)
  accu_bs <- rep(0, k.round*k.test)
  accu_ct <- rep(0, k.round*k.test)
  accu_c5 <- rep(0, k.round*k.test)

  train_bs <- rep(0, k.round*k.test)

  for (rnd in 1:k.round) {
    test.folds <- split.k.folds(1:n, k.test, seed = rnd*2017)
    for (testfd in 1:k.test) {
      test_index <- test.folds[[testfd]]
      train_index <- setdiff(1:n, test_index)

      newdata <- eval(parse(text = ds.names[ds]))[test_index,]
      actual <- eval(parse(text = ds.names[ds]))[test_index, ds.respvar[ds]]

      # ctree
      model_ct <- ctree(as.formula(ds.formula[ds]),
                        data = eval(parse(text = ds.names[ds])),
                        subset = train_index)
      pred_ct <- predict(model_ct, newdata, type = 'response')
      if (length(pred_ct) != length(actual)) stop("ctree: Predicted and Actual Dimension Mismatch.")
      accu_ct[(rnd - 1)*2 + testfd] <- sum(actual == pred_ct)/length(actual)

      # rpart
      model_rp <- rpart(as.formula(ds.formula[ds]),
                        data = eval(parse(text = ds.names[ds])),
                        subset = train_index)
      pred_rp <- predict(model_rp, newdata, type = 'class')
      if (length(pred_rp) != length(actual)) stop("rpart: Predicted and Actual Dimension Mismatch.")
      accu_rp[(rnd - 1)*2 + testfd] <- sum(actual == pred_rp)/length(actual)

      # C50
      model_c5 <- C5.0(as.formula(ds.formula[ds]),
                       data = eval(parse(text = ds.names[ds])),
                       subset = train_index)
      pred_c5 <- predict(model_c5, newdata, type = 'class')
      if (length(pred_rp) != length(actual)) stop("C50: Predicted and Actual Dimension Mismatch.")
      accu_c5[(rnd - 1)*2 + testfd] <- sum(actual == pred_c5)/length(actual)
      
      # bsnsing
      model_bs <- bsnsing(as.formula(ds.formula[ds]),
                          data = eval(parse(text = ds.names[ds])),
                          subset = train_index,
                          lambda = lambda,
                          nseg.numeric = nseg,
                          opt.model = opt.model,
                          node.size = node.size,
                          stop.prob = stop.prob,
                          max.rules = max.rules,
                          num2factor = num2factor,
                          verbose = verbose)
      pred_bs <- predict(model_bs, newdata, type = 'class')
      if (length(pred_bs) != length(actual)) stop("bsnsing: Predicted and Actual Dimension Mismatch.")
      accu_bs[(rnd - 1)*2 + testfd] <- sum(actual == pred_bs)/length(actual)
      train_actual <- eval(parse(text = ds.names[ds]))[train_index, ds.respvar[ds]]
      train_pred <- predict(model_bs, type = 'class')
      train_bs[(rnd - 1)*2 + testfd] <- sum(train_actual == train_pred)/length(train_actual)
    }
  }

  avg_accu_rp <- mean(accu_rp)
  avg_accu_ct <- mean(accu_ct)
  avg_accu_c5 <- mean(accu_c5)
  avg_accu_bs <- mean(accu_bs)
  sd_accu_rp <- sd(accu_rp)
  sd_accu_ct <- sd(accu_ct)
  sd_accu_c5 <- sd(accu_c5)
  sd_accu_bs <- sd(accu_bs)
  
  avg_train_bs <- mean(train_bs)
  sd_train_bs <- sd(train_bs)

  cat(paste(ds.names[ds], "\n"))
  cat("rpart: \n")
  print(accu_rp)
  print(avg_accu_rp)
  cat("ctree: \n")
  print(accu_ct)
  print(avg_accu_ct)
  cat("C50: \n")
  print(accu_c5)
  print(avg_accu_c5)
  cat("bsnsing: \n")
  print(accu_bs)
  print(avg_accu_bs)
  cat("bsnsing train: \n")
  print(train_bs)
  print(avg_train_bs)

  this.mean <- data.frame(dsname = ds.names[ds], bs_train = avg_train_bs, bs_accu = avg_accu_bs, rp_accu = avg_accu_rp, ct_accu = avg_accu_ct, c5_accu = avg_accu_c5)
  testUCImean <- rbind(testUCImean, this.mean)

  this.sd <- data.frame(dsname = ds.names[ds], bs_train = sd_train_bs, bs_accu_sd = sd_accu_bs, rp_accu_sd = sd_accu_rp, ct_accu_sd = sd_accu_ct, c5_accu_sd = sd_accu_c5)
  testUCIsd <- rbind(testUCIsd, this.sd)

}

testUCImean
#testUCIsd
write.csv(testUCImean, file = 'data2/testUCImean.csv', row.names = F)
write.csv(testUCIsd, file = 'data2/testUCIsd.csv', row.names = F)
