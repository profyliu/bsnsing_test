library(plotrix)
library(rpart)
library(rpart.plot)

P <- 50  # number of positive cases
N <- 50  # number of negative cases
x1rng <- c(-10,10)
x2rng <- c(-10,10)

psudo.min = -15
psudo.max = 15
eps = 0.03
pch.shift = 16
col.shift = 1
cex.lab = 1.5
cex.axis = 1.5
cex.main = 1.5
cex = 1.2
cex.sub = 1.2
poly.col = "grey75"
pdf.width = 7
pdf.height = 7
pdf.path = "fig/"

load(file = "data/oblique.RData")

bs <- bsnsing(y ~ x1 + x2, data = df, verbose = T)
summary(bs)



pdf.name = "oblique_bs"
pdf(file = paste0(pdf.path, pdf.name, ".pdf"), width = pdf.width, height = pdf.height)
subtt <- c("x1 <= -0.80 | x2 > 8.20", "x1 <= -7.70 | x2 > -5.41", "x1 > 1.06 | x2 < 1.11")
for (stp in 0:3) {
  with(df, {
    plot(x1,x2, col = (y + col.shift), pch = (y + pch.shift), cex.lab = cex.lab, cex.axis = cex.axis, cex = cex, cex.main = cex.main, xlim = x1rng, ylim = x2rng, main = ifelse(stp == 0, "", paste("Split", stp)))
  })
  title(sub = ifelse(stp == 0, "", subtt[stp]), cex.sub = cex.sub)
  if (stp >= 1)
    polygon(c(-0.795810334384441, psudo.max, psudo.max, -0.795810334384441),
            c(psudo.min, psudo.min, 8.19838927593082, 8.19838927593082),
            col = poly.col)
  if (stp >= 2)
    polygon(c(-7.70275213755667,-0.795810334384441,-0.795810334384441,-7.70275213755667),
            c(psudo.min, psudo.min, -5.41478818515316, -5.41478818515316),
            col = poly.col)
  if (stp >= 3)
    polygon(c(-0.795810334384441, 1.05970688397065, 1.05970688397065, -0.795810334384441),
            c(1.11030098982155, 1.11030098982155, 8.19838927593082, 8.19838927593082),
            col = 'white')
  with(df, {
    points(x1,x2, col = (y + col.shift), pch = (y + pch.shift), cex.lab = cex.lab, cex.axis = cex.axis, cex = cex)
  })
  box()
  abline(0,1,lty=2)
}
dev.off()

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

load(file = "data/circular.RData")

bs <- bsnsing(y ~ x1 + x2, data = df, verbose = T)
summary(bs)

rp <- rpart(y ~ x1 + x2, data = df, minsplit = 10)
rp$splits
rpart.plot(rp)
table(ifelse(predict(rp, df) >= 0.5, 1, 0), df$y)

## bsnsing
pdf.name = "circular_bs"
pdf(file = paste0(pdf.path, pdf.name, ".pdf"), width = pdf.width, height = pdf.height)

subtt <- c("x1 >= -5.62", "x2 <= 5.64", "x2 >= -6.35", "x1 <= 6.04")
for (stp in 0:4) {
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


###### Ring

load(file = "data/ring.RData")



# bsnsing solution
# ## hybrid
bs <- bsnsing(y ~ x1 + x2, data = df, verbose = T)
summary(bs)

pdf.name = "ring_bs"
pdf(file = paste0(pdf.path, pdf.name, ".pdf"), width = pdf.width, height = pdf.height)
cex = 1

subtt = c("x2 <= 7.02",
          "x2 >= -7.31",
          "x1 <= 7.25",
          "x1 > 7.51 | x2 < -0.23",
          "x1 >= -6.74",
          "x1 > 1.40 | x1 < -2.85 | x2 > 4.64 | x2 < -5.12",
          "x1 > 6.14 | x1 < 5.99",
          "x1 > 4.83 | x1 < -4.85 | x2 > 1.83 | x2 < -1.74",
          "x1 > -4.45 | x2 > -4.98",
          "x1 < 2.84 | x2 > -6.44"
)

for (stp in 0:10) {
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
    polygon(c(7.24987729918212, psudo.max, psudo.max, 7.24987729918212),
            c(-7.30526971863583, -7.30526971863583, 7.02424655435607, 7.02424655435607),
            col = poly.col, border = T)
  if (stp >= 4)
    polygon(c(7.24987729918212, 7.50762130133808, 7.50762130133808, 7.24987729918212),
            c(-0.23360580438748, -0.23360580438748, 7.02424655435607, 7.02424655435607),
            col = "white", border = T)
  if (stp >= 5)
    polygon(c(psudo.min, -6.7423078394495, -6.7423078394495, psudo.min),
            c(-7.30526971863583, -7.30526971863583, 7.02424655435607, 7.02424655435607),
            col = poly.col, border = T)
  if (stp >= 6)
    polygon(c(-2.85218622069806, 1.39833675464615, 1.39833675464615, -2.85218622069806),
            c(-5.11779064079747, -5.11779064079747, 4.63793539209291, 4.63793539209291),
            col = poly.col, border = T)
  if (stp >= 7)
    polygon(c(5.98711264319718, 6.14199591334909, 6.14199591334909, 5.98711264319718),
            c(-7.30526971863583, -7.30526971863583, 7.02424655435607, 7.02424655435607),
            col = poly.col, border = T)
  if (stp >= 8)
    polygon(c(-4.8510435060598, 4.82998291263357, 4.82998291263357, -4.8510435060598),
            c(-1.7382505023852, -1.7382505023852, 1.83177795261145, 1.83177795261145),
            col = poly.col, border = T)
  if (stp >= 9)
    polygon(c(-6.7423078394495, -4.45469222031534, -4.45469222031534, -6.7423078394495),
            c(-7.30526971863583, -7.30526971863583, -4.97760485624894, -4.97760485624894),
            col = poly.col, border = T)

  if (stp >= 10)
    polygon(c(2.84382817568257, 7.24987729918212, 7.24987729918212, 2.84382817568257),
            c(-7.30526971863583, -7.30526971863583, -6.44191647181287, -6.44191647181287),
            col = poly.col, border = T)

  with(df, {
    points(x1,x2, col = (y + col.shift), pch = (y + pch.shift), cex.lab = cex.lab, cex.axis = cex.axis, cex = cex)
  })
  box()
  draw.circle(0,0,5,lty=2)
  draw.circle(0,0,7.5,lty=2)
}
dev.off()

## rpart
rp <- rpart(y ~ x1 + x2, data = df, minsplit = 10)
rp$splits
rpart.plot(rp)
table(ifelse(predict(rp, df) >= 0.5, 1, 0), df$y)


## Glaucoma
library(ipred)
data("GlaucomaMVF")

glau_bs <- bsnsing(Class ~ ., data = GlaucomaMVF, verbose = T, opt.model = 'mip')
summary(glau_bs)

glau_rp <- rpart(Class ~., data = GlaucomaMVF)
rpart.plot(glau_rp)

glau_ct <- ctree(Class ~., data = GlaucomaMVF)
plot(glau_ct)
