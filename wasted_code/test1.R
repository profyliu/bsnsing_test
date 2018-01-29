# x1 = c(0.3, 0.7, 1.4, 2.1, 2.5, 2.8, 3.3, 3.9, 4.2, 4.7)
# x2 = c(2.4, 0.8, 4.3, 1.4, 3.9, 2.6, 3.5, 3.1, 4.0, 4.6)
# y = c(1,1,1,1,0,1,1,0,0,0)
# plot(x1,x2, col=(y+1), pch=16, xlim = c(0,5), ylim = c(0,5))
#abline(v = c(1,2,3,4), h = c(1,2,3,4), lty = 2)

# segments(0, 3.5, 3.3, 3.5)
# segments(3.3, 0, 3.3, 3.5)
# segments(0, 3.9, 3.9, 3.9, lty = 2)
# segments(3.9, 0, 3.9, 3.9, lty = 2)

# abline(v = 2.3, h = 3.0)
#
# x <- data.frame(x1 = x1, x2 = x2)
# bs <- bsnsing.default(x,y)

P <- 50  # number of positive cases
N <- 50  # number of negative cases
x1rng <- c(-10,10)
x2rng <- c(-10,10)


#################### oblique separation
oblique <- function(P, N, x1rng, x2rng) {
  x1 <- vector()
  x2 <- vector()
  y <- vector()
  np <- 0
  nn <- 0
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
  return(df)
}

# df <- oblique(P, N, x1rng, x2rng)
load(file = "data/oblique.RData")

bs <- bsnsing(y ~ x1 + x2, data = df, verbose = T)
summary(bs)



# with(df, {
#   plot(x1,x2, col=(y+1), pch=16, xlim = x1rng, ylim = x2rng, cex.lab = 1.5, cex.axis = 1.5)
# })
# abline(v = c(-7.9114304529503, -0.795810334384441, 1.85425542993471, 4.64430769905448),
#        h = c(-8.93947234610096, -3.8757735164836, 1.1229879502207, 8.19032628554851))
# abline(0,1,lty=2)

psudo.min = -15
psudo.max = 15
eps = 0.03
pch.shift = 16
col.shift = 1
cex.lab = 1.5
cex.axis = 1.5
cex.main = 1.5
cex = 1.0
cex.sub = 1.0
poly.col = "grey75"
pdf.width = 7
pdf.height = 7
pdf.path = "fig/"
pdf.name = "oblique_bs"

pdf(file = paste0(pdf.path, pdf.name, ".pdf"), width = pdf.width, height = pdf.height)
subtt <- c("x1 <= -0.80 | x2 > 8.20", "x1 <= -7.91 | x2 > -3.4", "x1 > 1.85 | x2 < 1.11")
for (stp in 0:3) {
  with(df, {
    plot(x1,x2, col = (y + col.shift), pch = (y + pch.shift), cex.lab = cex.lab, cex.axis = cex.axis, cex = cex, cex.main = cex.main, xlim = x1rng, ylim = x2rng, main = ifelse(stp == 0, "", paste("Split", stp)))
  })
  title(sub = ifelse(stp == 0, "", subtt[stp]), cex.sub = cex.sub)
  if (stp >= 1)
  polygon(c(-0.795810334384441, psudo.max, psudo.max, -0.795810334384441), c(psudo.min, psudo.min, 8.19838927593082, 8.19838927593082), col = poly.col)
  if (stp >= 2)
  polygon(c(-7.9114304529503,-0.795810334384441,-0.795810334384441,-7.9114304529503),
          c(psudo.min, psudo.min, -3.43765083001927, -3.43765083001927),
          col = poly.col)
  if (stp >= 3)
  polygon(c(-0.795810334384441, 1.85425542993471, 1.85425542993471, -0.795810334384441),
          c(1.11030098982155, 1.11030098982155, 8.19838927593082, 8.19838927593082),
          col = 'white')
  with(df, {
    points(x1,x2, col = (y + col.shift), pch = (y + pch.shift), cex.lab = cex.lab, cex.axis = cex.axis, cex = cex)
  })
  box()
  abline(0,1,lty=2)
}
dev.off()


# # split 4
# with(df, {
#   plot(x1,x2, col = (y + col.shift), pch = (y + pch.shift), cex.lab = cex.lab, cex.axis = cex.axis, cex = cex, cex.main = cex.main, xlim = x1rng, ylim = x2rng, main = "Split 4")
# })
# polygon(c(-0.795810334384441, psudo.max, psudo.max, -0.795810334384441), c(psudo.min, psudo.min, 8.19838927593082, 8.19838927593082), col = poly.col)
# # polygon(c(-0.795810334384441, -0.795810334384441, 1.85425542993471, 1.85425542993471, psudo.max,
# #           rev(c(-0.795810334384441, -0.795810334384441, 1.85425542993471, 1.85425542993471, psudo.max))),
# #         c(rep(psudo.min, 5),
# #           rev(c(psudo.min, 1.11030098982155, 1.11030098982155, 8.19838927593082, 8.19838927593082))),
# #         col = poly.col)
# polygon(c(-7.9114304529503,-0.795810334384441,-0.795810334384441,-7.9114304529503),
#         c(psudo.min, psudo.min, -3.43765083001927, -3.43765083001927),
#         col = poly.col)
# polygon(c(-0.795810334384441, 1.85425542993471, 1.85425542993471, -0.795810334384441),
#         c(1.11030098982155, 1.11030098982155, 8.19838927593082, 8.19838927593082),
#         col = 'white')
# polygon(c(psudo.min, -7.9114304529503, -7.9114304529503, psudo.min),
#         c(psudo.min, psudo.min, -8.93947234610096, -8.93947234610096),
#         col = poly.col)
# with(df, {
#   points(x1,x2, col = (y + col.shift), pch = (y + pch.shift), cex.lab = cex.lab, cex.axis = cex.axis, cex = cex)
# })
# box()
# abline(0,1,lty=2)
#
# # split 5
# with(df, {
#   plot(x1,x2, col = (y + col.shift), pch = (y + pch.shift), cex.lab = cex.lab, cex.axis = cex.axis, cex = cex, cex.main = cex.main, xlim = x1rng, ylim = x2rng, main = "Split 5")
# })
# polygon(c(-0.795810334384441, psudo.max, psudo.max, -0.795810334384441), c(psudo.min, psudo.min, 8.19838927593082, 8.19838927593082), col = poly.col)
# # polygon(c(-0.795810334384441, -0.795810334384441, 1.85425542993471, 1.85425542993471, psudo.max,
# #           rev(c(-0.795810334384441, -0.795810334384441, 1.85425542993471, 1.85425542993471, psudo.max))),
# #         c(rep(psudo.min, 5),
# #           rev(c(psudo.min, 1.11030098982155, 1.11030098982155, 8.19838927593082, 8.19838927593082))),
# #         col = poly.col)
# polygon(c(-7.9114304529503,-0.795810334384441,-0.795810334384441,-7.9114304529503),
#         c(psudo.min, psudo.min, -3.43765083001927, -3.43765083001927),
#         col = poly.col)
# polygon(c(psudo.min, -7.9114304529503, -7.9114304529503, psudo.min),
#         c(psudo.min, psudo.min, -8.93947234610096, -8.93947234610096),
#         col = poly.col)
# polygon(c(-0.795810334384441, 1.85425542993471, 1.85425542993471, -0.795810334384441),
#         c(1.11030098982155, 1.11030098982155, 8.19838927593082, 8.19838927593082),
#         col = 'white')
# polygon(c(4.62958150310442, 4.68123579630628, 4.68123579630628, 4.62958150310442),
#         c(psudo.min, psudo.min, 8.19838927593082, 8.19838927593082),
#         col = 'white', border = F)
# with(df, {
#   points(x1,x2, col = (y + col.shift), pch = (y + pch.shift), cex.lab = cex.lab, cex.axis = cex.axis, cex = cex)
# })
# box()
# abline(0,1,lty=2)





##### rpart #####

rp <- rpart(y ~ x1 + x2, data = df, minsplit = 10)
rp$splits
rpart.plot(rp)

pdf.name = "oblique_rp"
pdf(file = paste0(pdf.path, pdf.name, ".pdf"), width = pdf.width, height = pdf.height)

for (stp in 0:4) {
  with(df, {
    plot(x1,x2, col = (y + col.shift), pch = (y + pch.shift), cex.lab = cex.lab, cex.axis = cex.axis, cex = cex, cex.main = cex.main, xlim = x1rng, ylim = x2rng, main = ifelse(stp == 0, "", paste("Split", stp)))
  })
  if (stp >= 1)
  polygon(c(1.355916, psudo.max, psudo.max, 1.355916), c(psudo.min, psudo.min, psudo.max, psudo.max), col = poly.col, border = T)
  if (stp >= 2)
  polygon(c(1.355916, psudo.max, psudo.max, 1.355916), c(6.550004, 6.550004, psudo.max, psudo.max), col = "white")
  if (stp >= 3)
  polygon(c(psudo.min, 1.355916, 1.355916, psudo.min), c(psudo.min, psudo.min, -3.437651, -3.437651), col = poly.col, border = T)
  if (stp >= 4)
  polygon(c(psudo.min, -7.039345, -7.039345, psudo.min), c(psudo.min, psudo.min, -3.437651, -3.437651), col = "white")
  with(df, {
    points(x1,x2, col = (y + col.shift), pch = (y + pch.shift), cex.lab = cex.lab, cex.axis = cex.axis, cex = cex)
  })
  box()
  abline(0,1,lty=2)
}
dev.off()



############## Circular separation

circular <- function(P, N, x1rng, x2rng) {
  x1 <- vector()
  x2 <- vector()
  y <- vector()
  np <- 0
  nn <- 0
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
  return(df)
}

# df <- circular(P, N, x1rng, x2rng)
# write.csv(df, file = "data/circular.csv")
# save(df, file = "data/circular.RData")

load(file = "data/circular.RData")

with(df, {
  plot(x1,x2, col = (y + col.shift), pch = (y + pch.shift), cex.lab = cex.lab, cex.axis = cex.axis, cex = cex, cex.main = cex.main, xlim = x1rng, ylim = x2rng)
})
draw.circle(0,0,6,lty=2)

bs <- bsnsing(y ~ x1 + x2, data = df, verbose = T)
summary(bs)

rp <- rpart(y ~ x1 + x2, data = df, minsplit = 10)
rp$splits
rpart.plot(rp)
table(ifelse(predict(rp, df) >= 0.5, 1, 0), df$y)

## bsnsing
pdf.name = "circular_bs"
pdf(file = paste0(pdf.path, pdf.name, ".pdf"), width = pdf.width, height = pdf.height)

subtt <- c("x1 >= -5.62", "x2 <= 5.64", "x2 >= -6.35", "x1 <= 6.04", "x1 > -4.28 | x2 > -4.07")
for (stp in 0:5) {
  with(df, {
    plot(x1,x2, col = (y + col.shift), pch = (y + pch.shift), cex.lab = cex.lab, cex.axis = cex.axis, cex = cex, cex.main = cex.main, xlim = x1rng, ylim = x2rng, main = ifelse(stp == 0, "", paste("Split", stp)))
  })
  title(sub = ifelse(stp == 0, "", subtt[stp]), cex.sub = cex.sub)
  if (stp >= 1)
  polygon(c(psudo.min, -5.6232046848163, -5.6232046848163, psudo.min),
          c(psudo.min, psudo.min, psudo.max, psudo.max),
          col = poly.col, border = T)
  if (stp >= 2)
  polygon(c(-5.6232046848163, psudo.max, psudo.max, -5.6232046848163),
          c(5.63798358198255, 5.63798358198255, psudo.max, psudo.max),
          col = poly.col, border = T)
  if (stp >= 3)
  polygon(c(-5.6232046848163, psudo.max, psudo.max, -5.6232046848163),
          c(psudo.min, psudo.min, -6.349183882121, -6.349183882121),
          col = poly.col, border = T)
  if (stp >= 4)
  polygon(c(6.04140839306638, psudo.max, psudo.max, 6.04140839306638),
          c(-6.349183882121, -6.349183882121, 5.63798358198255, 5.63798358198255),
          col = poly.col, border = T)
  if (stp >= 5)
  polygon(c(-5.6232046848163, -4.27680844906718, -4.27680844906718, -5.6232046848163),
          c(-6.349183882121, -6.349183882121, -4.06793579109944, -4.06793579109944),
          col = poly.col, border = T)

  with(df, {
    points(x1,x2, col = (y + col.shift), pch = (y + pch.shift), cex.lab = cex.lab, cex.axis = cex.axis, cex = cex)
  })
  box()
  draw.circle(0,0,6,lty=2)
}
dev.off()

## rpart
pdf.name = "circular_rp"
pdf(file = paste0(pdf.path, pdf.name, ".pdf"), width = pdf.width, height = pdf.height)

for (stp in 0:5){
  with(df, {
    plot(x1,x2, col = (y + col.shift), pch = (y + pch.shift), cex.lab = cex.lab, cex.axis = cex.axis, cex = cex, cex.main = cex.main, xlim = x1rng, ylim = x2rng, main = ifelse(stp == 0, "", paste("Split", stp)))
  })
  if (stp >= 1)
  polygon(c(psudo.min, -5.623205, -5.623205, psudo.min),
          c(psudo.min, psudo.min, psudo.max, psudo.max),
          col = poly.col, border = T)
  if (stp >= 2)
  polygon(c(-5.623205, psudo.max, psudo.max, -5.623205),
          c(5.637984, 5.637984, psudo.max, psudo.max),
          col = poly.col, border = T)
  if (stp >= 3)
  polygon(c(-5.623205, psudo.max, psudo.max, -5.623205),
          c(psudo.min, psudo.min, -6.349184, -6.349184),
          col = poly.col, border = T)
  if (stp >= 4)
  polygon(c(6.041408, psudo.max, psudo.max, 6.041408),
          c(-6.349184, -6.349184, 5.637984, 5.637984),
          col = poly.col, border = T)
  if (stp >= 5)
  polygon(c(-5.623205, -4.276808, -4.276808, -5.623205),
          c(-6.349184, -6.349184, 5.637984, 5.637984),
          col = "snow", border = T)
  with(df, {
    points(x1,x2, col = (y + col.shift), pch = (y + pch.shift), cex.lab = cex.lab, cex.axis = cex.axis, cex = cex)
  })
  box()
  draw.circle(0,0,6,lty=2)
}
dev.off()


## 8-shaped
up.center <- 4
lo.center <- -4
small.rad <- 3
big.rad <- 4.5

shape88 <- function(P, N, x1rng, x2rng) {
  x1 <- vector()
  x2 <- vector()
  y <- vector()
  np <- 0
  nn <- 0
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
  return(df)
}

shape88 <- shape88(300, 300, x1rng, x2rng)
write.csv(shape88, file = "data/shape88.csv")
save(shape88, file = "data/shape88.RData")

shape88test <- shape88(1000, 1000, x1rng, x2rng)
write.csv(shape88test, file = 'data/shape88test.csv')
save(shape88test, file = 'data/shape88test.RData')

load(file = "data/shape88.RData")

cex.lab = 1.5
cex.axis = 1.5
cex.main = 1.5
cex = 1

with(shape88, {
  plot(x1,x2, col = (y + col.shift), pch = (y + pch.shift), cex.lab = cex.lab, cex.axis = cex.axis, cex = cex, cex.main = cex.main, xlim = x1rng, ylim = x2rng)
})

bs <- bsnsing(y ~ x1 + x2, data = shape88, verbose = T, opt.model = 'mip')
summary(bs)

load(file = 'data/shape88test.RData')
pred <- predict(bs, shape88test[, c("x1","x2")], type = 'class')
accu_bs <- sum(pred == shape88test[,'y'])/length(pred)
accu_bs

rp <- rpart(y ~ x1 + x2, data = shape88)
pred_rp <- ifelse(predict(rp, shape88test[, c("x1","x2")]) >= 0.5, 1, 0)
accu_rp <- sum(pred_rp == shape88test[,'y'])/length(pred)
accu_rp


###### Ring

ring <- function(P, N, x1rng, x2rng) {
  x1 <- vector()
  x2 <- vector()
  y <- vector()
  np <- 0
  nn <- 0
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
  return(df)
}

ring400 <- ring(200, 200, x1rng, x2rng)
save(ring400, file = 'data/ring400.RData')
load(file = 'data/ring400.RData')

#df <- ring(100, 100, x1rng, x2rng)
#write.csv(df, file = "data/ring.csv")
#save(df, file = "data/ring.RData")

load(file = "data/ring.RData")

cex = 1
with(ring400, {
  plot(x1,x2, col = (y + col.shift), pch = (y + pch.shift), cex.lab = cex.lab, cex.axis = cex.axis, cex = cex, cex.main = cex.main, xlim = x1rng, ylim = x2rng)
})
#draw.circle(0, 0, c(5, 7.5), lty = 2)
abline(v = c(7.50762130133808, -7.4096048111096),
       h = c(7.02424655435607, -7.30526971863583))
abline(v = c(-3.15160716418177, 4.20334337279201),
       h = c(-4.14448169991374, 3.80654070759192))



ring400_bs <- bsnsing(y ~ x1 + x2, data = ring400, verbose = T)
summary(ring400_bs)

# obs in node 9
obs9 <- (bs$tree.nodes)[[10]]$node.obs
b9x1 <- binarize.numeric(df[obs9, 'x1'], 'x1', df[obs9, 'y'])
b9x2 <- binarize.numeric(df[obs9, 'x2'], 'x2', df[obs9, 'y'])
sum(b9x1[, 'x1 > 4.66934931930155'] & b9x2[,'x2 <= -4.68771165935323'])
b9x <- cbind(b9x1, b9x2)
bsnsing.learn(b9x, df[obs9, 'y'])
bsnsing.learn(b9x, 1-df[obs9, 'y'])
bsnsing.learn(b9x[,c("x1 <= 4.66934931930155", "x1 > 4.66934931930155", "x2 <= -4.68771165935323", "x2 > -4.68771165935323")], df[obs9, 'y'])
bsnsing.learn(b9x[,c("x1 <= 4.66934931930155", "x2 > -4.68771165935323")], df[obs9, 'y'])


rp <- rpart(y ~ x1 + x2, data = df, minsplit = 10)
rp$splits
rpart.plot(rp)
table(ifelse(predict(rp, df) >= 0.5, 1, 0), df$y)

# bsnsing solution
# ## hybrid
bs <- bsnsing(y ~ x1 + x2, data = df, verbose = T, lambda = 1)
summary(bs)


pdf.name = "ring_bs"
pdf(file = paste0(pdf.path, pdf.name, ".pdf"), width = pdf.width, height = pdf.height)
cex = 1

subtt = c("x2 <= 7.02",
          "x2 >= -7.31",
          "x1 <= 7.51",
          "x1 >= -7.41",
          "x1 <= -3.15 | x1 > 4.20 | x2 <= -4.14 | x2 > 3.81",
          "x1 <= 4.67 | x2 > -4.69",
          "x1 > -4.39 | x2 > -4.88",
          "x1 > -5.57 | x2 <= 2.68",
          "x1 <= 4.72 | x2 <= 5.12",
          "x1 > -4.39 | x2 <= 5.11",
          "x1 < 3.38 | x2 <= 2.56",
          "x2 <= -2.95"
          )

for (stp in 0:12) {
  with(df, {
    plot(x1,x2, col = (y + col.shift), pch = (y + pch.shift), cex.lab = cex.lab, cex.axis = cex.axis, cex = cex, cex.main = cex.main, xlim = x1rng, ylim = x2rng, main = ifelse(stp == 0, "", paste("Split", stp)))
  })
  title(sub = ifelse(stp == 0, "", subtt[stp]), cex.sub = cex.sub)
  if (stp >= 1)
  polygon(c(psudo.min, psudo.max, psudo.max, psudo.min),
          c(7.02424655435607, 7.02424655435607, psudo.max, psudo.max),
          col = poly.col, border = T)
  if (stp >= 2)
  polygon(c(psudo.min, psudo.max, psudo.max, psudo.min),
          c(psudo.min, psudo.min, -7.30526971863583, -7.30526971863583),
          col = poly.col, border = T)
  if (stp >= 3)
  polygon(c(7.50762130133808, psudo.max, psudo.max, 7.50762130133808),
          c(-7.30526971863583, -7.30526971863583, 7.02424655435607, 7.02424655435607),
          col = poly.col, border = T)
  if (stp >= 4)
  polygon(c(psudo.min, -7.4096048111096, -7.4096048111096, psudo.min),
          c(-7.30526971863583, -7.30526971863583, 7.02424655435607, 7.02424655435607),
          col = poly.col, border = T)
  if (stp >= 5)
  polygon(c(-3.15160716418177, 4.20334337279201, 4.20334337279201, -3.15160716418177),
          c(-4.14448169991374, -4.14448169991374, 3.80654070759192, 3.80654070759192),
          col = poly.col, border = T)
  if (stp >= 6)
  polygon(c(4.66934931930155, 7.50762130133808, 7.50762130133808, 4.66934931930155),
          c(-7.30526971863583, -7.30526971863583, -4.68771165935323, -4.68771165935323),
          col = poly.col, border = T)
  if (stp >= 7)
  polygon(c(-7.4096048111096, -4.38879024703056, -4.38879024703056, -7.4096048111096),
          c(-7.30526971863583, -7.30526971863583, -4.68771165935323, -4.68771165935323),
          col = poly.col, border = T)
  if (stp >= 8)
  polygon(c(-7.4096048111096, -5.56910431943834, -5.56910431943834, -7.4096048111096),
          c(2.67756497953087, 2.67756497953087, 7.02424655435607, 7.02424655435607),
          col = poly.col, border = T)
  if (stp >= 9)
  polygon(c(4.72330882097594, 7.50762130133808, 7.50762130133808, 4.72330882097594),
          c(5.12446383479983, 5.12446383479983, 7.02424655435607, 7.02424655435607),
          col = poly.col, border = T)
  if (stp >= 10)
  polygon(c(-5.56910431943834, -4.38766428502277, -4.38766428502277, -5.56910431943834),
          c(5.10674591991119, 5.10674591991119, 7.02424655435607, 7.02424655435607),
          col = poly.col, border = T)
  if (stp >= 11)
  polygon(c(3.38044732576236, 4.20334337279201, 4.20334337279201, 3.38044732576236),
          c(2.56138123106211, 2.56138123106211, 3.80654070759192, 3.80654070759192),
          col = 'white', border = T)
  if (stp >= 12)
  polygon(c(-3.15160716418177, 4.20334337279201, 4.20334337279201, -3.15160716418177),
          c(-4.14448169991374, -4.14448169991374, -2.95320967212319, -2.95320967212319),
          col = 'white', border = T)

  with(df, {
    points(x1,x2, col = (y + col.shift), pch = (y + pch.shift), cex.lab = cex.lab, cex.axis = cex.axis, cex = cex)
  })
  box()
  draw.circle(0,0,5,lty=2)
  draw.circle(0,0,7.5,lty=2)
}
dev.off()

abline(v = c(7.46587621979415, 5.85597089026123, 4.66934931930155),
       h = c(-6.98043417884037, -5.96937176887877, -4.68771165935323))

with(df, points(x1[obs9], x2[obs9], col = 'blue', pch = 1))


## hybrid
bs <- bsnsing(y ~ x1 + x2, data = df, verbose = T, lambda = 1)
summary(bs)


obs23 <- (bs$tree.nodes)[[25]]$node.obs
b23x1 <- binarize.numeric(df[obs23, 'x1'], 'x1', df[obs23, 'y'])
b23x2 <- binarize.numeric(df[obs23, 'x2'], 'x2', df[obs23, 'y'])
b23x <- cbind(b23x1, b23x2)
bsnsing.learn(b23x, df[obs23, 'y'], bsnsing.control(opt.model = 'mip', lambda = 0))


