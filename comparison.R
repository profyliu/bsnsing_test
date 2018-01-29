library(bsnsing)
library(rpart)
library(party)
library(mlbench)
library(C50)

setwd("C:\\Users\\gn0061\\Google Drive\\R_code\\bsnsing_test")

# split 1:n into k folds
split.k.folds <- function(indset, k, seed = 2017) {
  folds <- list()
  curset <- indset
  n <- length(indset)
  curn <- n
  for (i in 1:k) {
    set.seed(seed)
    folds[[i]] <- sample(curset, round(curn/(k - i + 1)))
    curset <- setdiff(curset, folds[[i]])
    curn <- length(curset)
  }
  return(folds)
}

# Load birthwt
data(birthwt, package = 'MASS')
birthwt$low <- as.factor(birthwt$low)

# Load Titanic
library(datasets)
ti <- as.data.frame(Titanic)
# expand the data by the Freq column
titanic <- with(ti, {
  data.frame(Class = rep(Class, Freq), Sex = rep(Sex, Freq), Age = rep(Age, Freq), Survived = rep(Survived, Freq))
})


# Load Wisconsin Breast Cancer (wdbc) Data
# wdbc <- read.table(url("http://archive.ics.uci.edu/ml/machine-learning-databases/breast-cancer-wisconsin/wdbc.data"),
#                    sep = ',',
#                    header = F)
# save(wdbc, file = 'data/wdbc.RData')
load(file = 'data/wdbc.RData')
names(wdbc)[1:2] <- c("ID", "class")
wdbc$ID <- NULL

# Load heart
heart <- read.csv("data/Heart.csv", header = T, stringsAsFactors = T)
rownames(heart) <- heart$X
heart$X <- NULL

# Load GlaucomaMVF
data("GlaucomaMVF", package = "ipred") 


# Load the Auto data
library(ISLR)
auto = Auto
auto$origin <- as.factor(ifelse(Auto$origin == 1, "USA", "EUJ"))

# Load the parkinsons data
parkin <- read.csv(file = 'data/parkinsons.data', header = T, sep = ',')
rownames(parkin) <- parkin$name
parkin$name <- NULL
parkin$status <- as.factor(parkin$status)

# Load the Indian Liver Patient Dataset (ILPD)
ILPD <- read.csv(file = 'data/ILPD.csv', header = F)
colnames(ILPD) <- c("Age", "Gender", "TB", "DB", "Alkphos", "Sgpt", "Sgot", "TP", "ALB", "AG", "Selector")
ILPD$Selector <- as.factor(ILPD$Selector)

# Load the Ionosphere dataset
Ionos <- read.csv(file = "data/Ionosphere.data", header = F)
colnames(Ionos)[35] <- "Class"

# Load the pima-indians-diabetes dataset
pima <- read.csv(file = "data/pima-indians-diabetes.data", header = F)
colnames(pima) <- c("TimesPregnant", "Glucose", "BloodPressure", "SkinThickness", "SerumInsulin", "BMI", "DiabetesPedigree","Age", "Class")
pima$Class <- as.factor(pima$Class)

# Load the sonar data
sonar <- read.csv(file = "data/sonar.data", header = F)
colnames(sonar)[61] <- "Class"

# Load the blood transfusion service center dataset
trans <- read.csv(file = "data/transfusion.data", header = T)
trans$donated.blood <- as.factor(trans$donated.blood)

# Load the peptide dataset
peptide <- read.csv(file = "data/peptide.data", header = T, sep = " ")
rownames(peptide) <- peptide$id
peptide$id <- NULL
peptide$bind <- as.factor(peptide$bind)

# Load the hepatitis dataset
hepatitis <- read.csv(file = "data/hepatitis.data", header = F, na.strings = "?")
colnames(hepatitis) <- c("Class", "Age", "Sex", "Steroid",
                         "Antivirals", "Fatigue", "Malaise",
                         "Anorexia", "LiverBig", "LiverFirm",
                         "SpleenPalpable", "Spiders", "Ascites",
                         "Varices", "Bilirubin", "AlkPhosphate",
                         "SGOT", "Albumin", "Protime", "Histology")
hepatitis$Class <- ifelse(hepatitis$Class == 1, "Die", "Live")
hepatitis$Class <- as.factor(hepatitis$Class)

# Load the dermatology dataset
derm <- read.csv(file = "data/dermatology.data", header = F, na.strings = "?")
derm.names <- read.csv(file = "data/dermatology.names", header = F)
colnames(derm) <- derm.names$V1
derm$class <- as.factor(derm$class)

# Dermatology with small perturbation
derm.noi <- derm
derm.noi[, 1:34] <- derm.noi[, 1:34] + matrix(rnorm(nrow(derm.noi)*(ncol(derm.noi)-1), 0, 0.001), nrow = nrow(derm.noi), ncol = ncol(derm.noi) - 1)

# Load iris
Iris <- iris
iris_noise <- matrix(rnorm(nrow(Iris)*(ncol(Iris)-1), 0, 0.001), nrow = nrow(Iris), ncol = ncol(Iris) - 1)
Iris[, 1:4] <- Iris[, 1:4] + iris_noise

# Load the dystrophy dataset
data('dystrophy', package = 'ipred')

# Load the smiley data
smiley <- as.data.frame(mlbench.smiley())
colnames(smiley) <- c('x1','x2','class')

# Load the spirals data
spirals <- as.data.frame(mlbench.spirals(600, 1.5, 0.05))
colnames(spirals) <- c('x1','x2','class')

# Load the MNIST data
#mnist <- read.csv(file = "data/short_prac_train.csv", header = T, na.strings = "?")
#bs <- bsnsing(label ~ ., data = mnist, verbose = T)

# Load the proteomics dataset
protein = read.csv(file = "data/annotatedProteins.csv", header=T, na.strings = 'NA')
protein = na.omit(protein)
protein_pos <- protein[which(protein$mito.2015 == TRUE), c('mito.2015', 'iTRAQ8.113', 'iTRAQ8.114', 'iTRAQ8.115', 'iTRAQ8.116', 'iTRAQ8.117', 'iTRAQ8.118', 'iTRAQ8.119', 'iTRAQ8.121')]
P <- nrow(protein_pos)
protein_negall <- protein[which(protein$mito.2015 == FALSE), c('mito.2015', 'iTRAQ8.113', 'iTRAQ8.114', 'iTRAQ8.115', 'iTRAQ8.116', 'iTRAQ8.117', 'iTRAQ8.118', 'iTRAQ8.119', 'iTRAQ8.121')]
protein_neg <- protein_negall[sample(1:nrow(protein_negall), P), ]
protein_balanced <- rbind(protein_pos, protein_neg)
protein_balanced$mito.2015 <- as.factor(protein_balanced$mito.2015)
# train_index <- sample(1:nrow(protein_balanced), round(0.5*nrow(protein_balanced)))
# test_index <- setdiff(1:nrow(protein_balanced), train_index)
# 
# bs <- bsnsing(mito.2015 ~ iTRAQ8.113 + iTRAQ8.114 + iTRAQ8.115 + iTRAQ8.116 +
#                 iTRAQ8.117 + iTRAQ8.118 + iTRAQ8.119 + iTRAQ8.121, data = protein_balanced, subset = train_index, nseg.numeric = 5, stop.prob = 0.95, verbose = T)


# Load the Haberman data 
haberman <- read.table(file = 'data/haberman.data', header = FALSE, sep = ',')
colnames(haberman) <- c("age", "year", "axillary.nodes", "survival")
haberman$survival <- as.factor(ifelse(haberman$survival == 1, "Survived", "Died"))

# Load the mammograph data
mammo <- read.table(file = 'data/mammographic_masses.data', header = FALSE, sep = ',', na.strings = '?')
colnames(mammo) <- c('BI.RADS','Age','Shape','Margin','Density','Severity')
mammo$Shape <- as.factor(ifelse(mammo$Shape == 1, 'round', ifelse(mammo$Shape == 1, 'oval', ifelse(mammo$Shape == 3, 'lobular', ifelse(mammo$Shape == 4, 'irregular', 'unknown')))))
mammo$Margin <- as.factor(ifelse(mammo$Margin == 1, 'circumscribed', ifelse(mammo$Margin == 2, 'microlobulated', ifelse(mammo$Margin == 3, 'obscured', ifelse(mammo$Margin == 4, 'ill_defined', ifelse(mammo$Margin == 5, 'spiculated', 'unknown'))))))
mammo$Severity <- as.factor(ifelse(mammo$Severity == 0, 'benigh','malignant'))
mammo$Density <- as.factor(ifelse(mammo$Density == 1, 'hight', ifelse(mammo$Density == 2, 'iso', ifelse(mammo$Density == 3, 'low', ifelse(mammo$Density == 4, 'fat_containing', 'unknown')))))
mammo <- na.omit(mammo)


# Load the votes data
votes <- read.table(file = 'data/house-votes-84.data', header = F, sep = ',', na.strings = '?')
votes$V1 <- as.factor(votes$V1)

# Load the SPECT data
SPECT <- read.table(file = 'data/SPECT.data', header = F, sep = ',')
SPECT$V1 <- as.factor(SPECT$V1)


# Load the tic-tac-toe data
tictactoe <- read.table(file = 'data/tic-tac-toe.data', header = F, sep = ',')
tictactoe$V10 <- as.factor(tictactoe$V10)

# Load the car evaluation data
carEval <- read.table(file = 'data/car.data', header = F, sep = ',')
colnames(carEval) <- c('buying','maint','doors','persons','lug_boot','safety','value')
carEval$value <- as.factor(carEval$value)

#crime <- read.table('data/27062-0001-Data.tsv', header=TRUE, sep="\t", fileEncoding="windows-1252")

# data sets for testing
ds.names <- c("wdbc",
              "auto",
              "birthwt",
              "heart",
              "GlaucomaMVF",
              "titanic",
              "parkin",
              "ILPD",
              "Ionos",
              "pima",
              "sonar",
              "trans",
              "peptide",
              "hepatitis",
              "derm",
              "derm.noi",
              "iris",
              "Iris",
              "dystrophy",
              "smiley",
              "spirals",
              "protein_balanced",
              "haberman",
              "mammo",
              "votes",
              "SPECT",
              "tictactoe")
ds.formula <-c("class ~.",
               "origin ~ mpg + cylinders + displacement + horsepower + weight + acceleration",
               "low ~ age + lwt + race + smoke + ptl + ht + ui + ftv",  ## ctree does not recognize the formula "low ~ . - bwt" correctly
               "AHD ~ .",
               "Class ~ .",
               "Survived ~ .",
               "status ~ .",
               "Selector ~ .",
               "Class ~ .",
               "Class ~ .",
               "Class ~ .",
               "donated.blood ~ .",
               "bind ~ .",
               "Class ~ .",
               "class ~ .",
               "class ~ .",
               "Species ~ .",
               "Species ~ .",
               "Class ~ AGE + CK + H + PK + LD",
               "class ~ x1 + x2",
               "class ~ x1 + x2",
               "mito.2015 ~ iTRAQ8.113 + iTRAQ8.114 + iTRAQ8.115 + iTRAQ8.116 + 
                iTRAQ8.117 + iTRAQ8.118 + iTRAQ8.119 + iTRAQ8.121",
               "survival ~ age + year + axillary.nodes",
               "Severity ~ BI.RADS + Age + Shape + Margin + Density",
               "V1 ~ .",
               "V1 ~ .",
               "V10 ~ .")
ds.respvar <- c("class",
                "origin",
                "low",
                "AHD",
                "Class",
                "Survived",
                "status",
                "Selector",
                "Class",
                "Class",
                "Class",
                "donated.blood",
                "bind",
                "Class",
                "class",
                "class",
                "Species",
                "Species",
                "Class",
                "class",
                "class",
                "mito.2015",
                "survival",
                "Severity",
                "V1",
                "V1",
                "V10")



testUCImean <- data.frame(dsname = character(), bs_train = numeric(), bs_accu = numeric(), rp_accu = numeric(), ct_accu = numeric(), c5_accu = numeric())

testUCIsd <- data.frame(dsname = character(), bs_train_sd = numeric(), bs_accu_sd = numeric(), rp_accu_sd = numeric(), ct_accu_sd = numeric(), c5_accu_sd = numeric())


for (ds in 1:22) {

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
