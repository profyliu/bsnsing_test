library(ISLR)
auto = Auto
auto$origin <- as.factor(ifelse(Auto$origin == 1, "USA", "EUJ"))
#auto$origin <- as.factor(ifelse(Auto$origin == 1, 1, 0))

res = bsnsing(origin ~ mpg + cylinders + displacement + horsepower + weight + acceleration, data=Auto, stop.prob = 0.95, verbose = T)
res = bsnsing.formula(origin~displacement+mpg+year+weight, data=auto, verbose = T, opt.model = 'lp')
res = bsnsing.formula(origin~displacement+mpg+year+weight, data=auto, verbose = T, opt.model = 'mip')
res = bsnsing.formula(origin~displacement+mpg+year+weight, data=auto, verbose = T, stop.prob = 0.97, node.size = 10, lambda = 0)
summary(res)

res5 = bsnsing.formula(origin~displacement+mpg+year+weight, data=auto, subset=obs5, lambda = 1)

bs <- bsnsing(origin ~.-name, data = auto, verbose = T)
summary(bs)
pred.bs <- predict(bs, auto, type = 'class')
table(pred.bs, auto$origin)
rp <- rpart(origin ~.-name, data = auto)
rp <- rpart(origin ~.-name, data = auto, minsplit = 10)
pred.rp <- ifelse(predict(rp, auto) >= 0.5, 1, 0)
table(pred.rp, auto$origin)

