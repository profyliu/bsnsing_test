setwd("C:\\Users\\gn0061\\Google Drive\\R_code\\bsnsing_test")
library(plotrix)
library(bsnsing)
library(rpart)
library(rpart.plot)
load(file = "data/ring.RData")


x1rng <- c(-10,10)
x2rng <- c(-10,10)

psudo.min = -15
psudo.max = 15
eps = 0.03
pch.shift = 16
col.shift = 1
# cex.lab = 2.5
# cex.axis = 2.5
# cex.main = 3
# cex = 2
cex.sub = 2.5
poly.col = "grey75"
pdf.width = 28
pdf.height = 21
pdf.path = "fig/"




subtt = c("x2 <= 7.02",
          "x2 >= -7.31",
          "x1 <= 7.51",
          "x1 >= -6.74",
          
)


pdf.name = "ring_bs_1page"
pdf(file = paste0(pdf.path, pdf.name, ".pdf"), width = pdf.width, height = pdf.height)
par(mfrow = c(3, 4))
par(mar = c(6.1, 5.1, 4.1, 2.1))

stp <- 4
# for (stp in 0:11) {
  with(df, {
    plot(x1,x2, col = (y + col.shift), pch = (y + pch.shift), cex.lab = cex.lab, cex.axis = cex.axis, cex = cex, cex.main = cex.main, xlim = x1rng, ylim = x2rng, main = ifelse(stp == 0, "Original", paste("+ Split", stp)))
  })
  title(sub = ifelse(stp == 0, "", subtt[stp]), cex.sub = cex.sub, line = 4.7)
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
    polygon(c(psudo.min, -6.742308, -6.742308, psudo.min),
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
    polygon(c(-6.742308, -4.38879024703056, -4.38879024703056, -6.742308),
            c(-7.30526971863583, -7.30526971863583, -4.68771165935323, -4.68771165935323),
            col = poly.col, border = T)
  if (stp >= 8)
    polygon(c(-6.742308, -5.56910431943834, -5.56910431943834, -6.742308),
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
  # if (stp >= 12)
  #   polygon(c(-3.15160716418177, 4.20334337279201, 4.20334337279201, -3.15160716418177),
  #           c(-4.14448169991374, -4.14448169991374, -2.95320967212319, -2.95320967212319),
  #           col = 'white', border = T)
  
  with(df, {
    points(x1,x2, col = (y + col.shift), pch = (y + pch.shift), cex.lab = cex.lab, cex.axis = cex.axis, cex = cex)
  })
  box()
  draw.circle(0,0,5,lty=2)
  draw.circle(0,0,7.5,lty=2)
# }

par(mar = c(5.1, 4.1, 4.1, 2.1))
par(mfrow = c(1, 1))
dev.off()

