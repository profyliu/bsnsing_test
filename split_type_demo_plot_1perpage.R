setwd("C:\\Users\\gn0061\\Google Drive\\R_code\\bsnsing_test")
w = 2

pdf(file = "fig/split_types1.pdf", width = 3, height = 3)
par(mar = c(2,2,3,2))

plot(0,xlim=c(0,10),ylim=c(0,10),ylab='',xlab='',pch='', xaxt = 'n', yaxt = 'n', ann = F)
abline(v = 3, lwd = w)
segments(3,6,12,6,lwd = w)
segments(8,6,8,-2, lwd = w)
segments(5,6,5,12, lwd = w)
box(lwd = w)
title(main="Single-variable split", line = 0.3, cex.main = 1)

par(mar = c(5.1, 4.1, 4.1, 2.1))
dev.off()

pdf(file = "fig/split_types2.pdf", width = 3, height = 3)
par(mar = c(2,2,3,2))

plot(0,xlim=c(0,10),ylim=c(0,10),ylab='',xlab='',pch='', xaxt = 'n', yaxt = 'n', ann = F)
abline(v = 3, lwd = w)
rect(5,4,8,8, lwd = w)
rect(1,-2,3,7, lwd = w)
segments(3,6,5,6, lwd = w)
segments(7,-2,7,4, lwd = w)
box(lwd = w)
title(main="Multi-variable split", line = 0.3, cex.main = 1)

par(mar = c(5.1, 4.1, 4.1, 2.1))
dev.off()


pdf(file = "fig/split_types3.pdf", width = 3, height = 3)
par(mar = c(2,2,3,2))

plot(0,xlim=c(0,10),ylim=c(0,10),ylab='',xlab='',pch='', xaxt = 'n', yaxt = 'n', ann = F)
abline(v = 3, lwd = w)
segments(3,6,12,6,lwd = w)
segments(3,2,9,6, lwd = w)
segments(6,4,6,-2, lwd = w)
box(lwd = w)
title(main="Linear combination split", line = 0.3, cex.main = 1)

par(mar = c(5.1, 4.1, 4.1, 2.1))
dev.off()
