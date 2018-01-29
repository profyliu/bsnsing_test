# This script visualize the split process on artificially generated 2-dimensional datasets.
#
library(bsnsing)
library(rpart)
library(party)
source("tests/generate2Ddata.R")
setwd("C:\\Users\\gn0061\\Google Drive\\R_code\\bsnsing_test")

# Generate training set
n.each.class = 300
cex.lab = 2.5
cex.axis = 2.5
cex.main = 4
cex = 2
cex.sub = 2.5
pdf.width = 30
pdf.height = 5
pdf.path = "fig/"
pdf(file = paste0(pdf.path, "shapes_1x6.pdf"), width = pdf.width, height = pdf.height)
par(mfrow = c(1, 6))
par(mar = c(0.5, 0.5, 4.1, 0.5))
obli <- oblique(n.each.class, n.each.class, x1rng, x2rng)
grid <- grid2x2(n.each.class, n.each.class, x1rng, x2rng)
diam <- diamond(n.each.class, n.each.class, x1rng, x2rng)
circ <- circular(n.each.class, n.each.class, x1rng, x2rng)
ring <- ringshape(n.each.class, n.each.class, x1rng, x2rng)
sh88 <- shape88(n.each.class, n.each.class, x1rng, x2rng)
par(mar = c(5.1, 4.1, 4.1, 2.1))
par(mfrow = c(1, 1))
dev.off()

# Generate test set
diam.test <- diamond(2000, 2000, x1rng, x2rng, seed = 2018)
ring.test <- ringshape(2000, 2000, x1rng, x2rng, seed = 2018)
sh88.test <- shape88(2000, 2000, x1rng, x2rng, seed = 2018)
circ.test <- circular(2000, 2000, x1rng, x2rng, seed = 2018)
grid.test <- grid2x2(2000, 2000, x1rng, x2rng, seed = 2018)
obli.test <- oblique(2000, 2000, x1rng, x2rng, seed = 2018)

ds.names <- c("obli", "grid", "diam", "circ", "ring", "sh88")

# Save training sets to csv
for (ds in 1:6){
  write.csv(get(ds.names[ds]), file = paste0('data2/', ds.names[ds], '.csv'), row.names=FALSE)
}

test2d <- data.frame(dsname = character(), bs_accu = numeric(), rp_accu = numeric(), ct_accu = numeric())

for (ds in 1:6){

  traindata <- eval(parse(text = ds.names[ds]))
  traindata$y <- as.factor(traindata$y)
  newdata <- eval(parse(text = paste0(ds.names[ds],".test")))[, c('x1', 'x2')]
  actual <- eval(parse(text = paste0(ds.names[ds],".test")))[, 'y']

  bs <- bsnsing(y ~ x1 + x2, data = traindata, nseg.numeric = 30, stop.prob = 0.99)
  summary(bs)
  bs_pred <- predict(bs, newdata, type = 'class')
  (bs_accu <- sum(bs_pred == actual)/length(bs_pred))

  rp <- rpart(y ~ x1 + x2, data = traindata)
  rp_pred <- predict(rp, newdata, type = 'class')
  (rp_accu <- sum(rp_pred == actual)/length(rp_pred))

  ct <- ctree(y ~ x1 + x2, data = traindata)
  ct_pred <- predict(ct, newdata, type = "response")
  (ct_accu <- sum(ct_pred == actual)/length(ct_pred))

  this.result <- data.frame(dsname = ds.names[ds], bs_accu = bs_accu, rp_accu = rp_accu, ct_accu = ct_accu)
  test2d <- rbind(test2d, this.result)
}
test2d
write.csv(test2d, file = 'data2/test2d.csv', row.names = F)
