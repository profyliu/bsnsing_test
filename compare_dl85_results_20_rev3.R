

# First summarize the datasets
source_folder = "data/pydl8.5_datasets"
dest_folder = "data/pydl8.5_datasets_split_20"
data_files <- list.files(source_folder)
nfiles <- length(data_files)
dl85_summary <- data.frame(name=character(nfiles), n = integer(nfiles), p = integer(nfiles), mr = numeric(nfiles))
dl85_summary$name <- as.character(dl85_summary$name)
for(i in 1:length(data_files)){
  filename_stem <- strsplit(data_files[i],'[.]')[[1]][1]
  df <- read.table(paste0(source_folder, "/", data_files[i]), sep=" ", header=F)
  n <- nrow(df)
  p <- ncol(df) - 1  # -1 to exclude the y column
  mr <- sum(df[,1])/n
  if(mr > 0.5){
    mr = 1 - mr
  }
  dl85_summary[i,'name'] <- as.character(filename_stem)
  dl85_summary[i,'n'] <- n
  dl85_summary[i,'p'] <- p
  dl85_summary[i,'mr'] <- mr
}


library(sqldf)

bsr20d1 <- read.table("dl85_R_result_20_ns1over4_depth1.txt", header=T, sep=',')
bsp20d1 <- read.table("dl85_py_result_20_depth1.txt", header=T, sep=',')
bos20d1 <- read.table("dl85_osdt_result_20_depth1.txt", header=T, sep=',')
bsrd1 = sqldf("select name, avg(bs_accu) as bs_accu_d1 from bsr20d1 group by name")
bspd1 = sqldf("select name, avg(dl_accu) as dl_accu_d1 from bsp20d1 group by name")
bosd1 = sqldf("select name, avg(osdt_accu) as osdt_accu_d1 from bos20d1 group by name")

bsr20d2 <- read.table("dl85_R_result_20_ns1over4_depth2.txt", header=T, sep=',')
bsp20d2 <- read.table("dl85_py_result_20_depth2.txt", header=T, sep=',')
bos20d2 <- read.table("dl85_osdt_result_20_depth2.txt", header=T, sep=',')
bsrd2 = sqldf("select name, avg(bs_accu) as bs_accu_d2 from bsr20d2 group by name")
bspd2 = sqldf("select name, avg(dl_accu) as dl_accu_d2 from bsp20d2 group by name")
bosd2 = sqldf("select name, avg(osdt_accu) as osdt_accu_d2 from bos20d2 group by name")

bsr20d3 <- read.table("dl85_R_result_20_ns1over4_depth3.txt", header=T, sep=',')
bsp20d3 <- read.table("dl85_py_result_20.txt", header=T, sep=',')  # the default for dl85 is depth3
bos20d3 <- read.table("dl85_osdt_result_20_depth3.txt", header=T, sep=',')
bsrd3 = sqldf("select name, avg(bs_accu) as bs_accu_d3 from bsr20d3 group by name")
bspd3 = sqldf("select name, avg(dl_accu) as dl_accu_d3 from bsp20d3 group by name")
bosd3 = sqldf("select name, avg(osdt_accu) as osdt_accu_d3 from bos20d3 group by name")

mg <- merge(dl85_summary,bsrd1,by='name')
mg <- merge(mg,bspd1,by='name')
mg <- merge(mg,bosd1,by='name')

mg <- merge(mg,bsrd2,by='name')
mg <- merge(mg,bspd2,by='name')
mg <- merge(mg,bosd2,by='name')

mg <- merge(mg,bsrd3,by='name')
mg <- merge(mg,bspd3,by='name')
mg <- merge(mg,bosd3,by='name')

mg_base <- mg
# remove n, p, mr columns
mg_base$n <- NULL
mg_base$p <- NULL
mg_base$mr <- NULL

for(i in 1:nrow(mg_base)){
  this_text <- paste0(paste0(mg_base[i,c('name')], collapse = " & "), " & ")
  this_max_d1 <- max(mg_base[i,c('bs_accu_d1','dl_accu_d1','osdt_accu_d1')])
  this_max_d2 <- max(mg_base[i,c('bs_accu_d2','dl_accu_d2','osdt_accu_d2')])
  this_max_d3 <- max(mg_base[i,c('bs_accu_d3','dl_accu_d3','osdt_accu_d3')])
  for(j in 2:4){
      this_text <- paste0(this_text, ifelse(mg_base[i,j] >= this_max_d1, '\\textbf{', ''))
      this_text <- paste0(this_text, sprintf("%.3f", mg_base[i,j]))
      this_text <- paste0(this_text, ifelse(mg_base[i,j] >= this_max_d1, '}', ''))
      this_text <- paste0(this_text, ifelse(j==10, ' \\\\', ' & '))
  }
  for(j in 5:7){
    this_text <- paste0(this_text, ifelse(mg_base[i,j] >= this_max_d2, '\\textbf{', ''))
    this_text <- paste0(this_text, sprintf("%.3f", mg_base[i,j]))
    this_text <- paste0(this_text, ifelse(mg_base[i,j] >= this_max_d2, '}', ''))
    this_text <- paste0(this_text, ifelse(j==10, ' \\\\', ' & '))
  }
  for(j in 8:10){
    this_text <- paste0(this_text, ifelse(mg_base[i,j] >= this_max_d3, '\\textbf{', ''))
    this_text <- paste0(this_text, sprintf("%.3f", mg_base[i,j]))
    this_text <- paste0(this_text, ifelse(mg_base[i,j] >= this_max_d3, '}', ''))
    this_text <- paste0(this_text, ifelse(j==10, ' \\\\', ' & '))
  }
  cat(paste(this_text, " \n"))
}
cat(paste("\\hline", " \n"))
avg <- colMeans(mg_base[,2:10])
this_text <- "Average & "
for(j in 1:9){
  this_text <- paste0(this_text, sprintf("%.3f", avg[j]), ifelse(j==9, ' \\\\', ' & '))
}
cat(paste(this_text, " \n"))

