
library(bsnsing)

source_folder = "data/pydl8.5_datasets"
dest_folder = "data/pydl8.5_datasets_split_20"
log_filename = "dl85_R_result_20.txt"
data_files <- list.files(source_folder)

sink(file = log_filename, append = T)
cat("name, batch, bs_accu, bs_f1, bs_auc, bs_cpu, bs_nleaves, bs_depth, bs_accu_train \n")

for(i in 1:length(data_files)){
  filename_stem <- strsplit(data_files[i],'[.]')[[1]][1]
  for(k in 1:20){
    X_train = read.table(paste0(dest_folder, "/", filename_stem, "_X_train_", k, ".txt"), sep=" ", header = F)
    y_train = read.table(paste0(dest_folder, "/", filename_stem, "_y_train_", k, ".txt"), sep=" ", header = F)
    
    X_test = read.table(paste0(dest_folder, "/", filename_stem, "_X_test_", k, ".txt"), sep=" ", header = F)
    y_test = read.table(paste0(dest_folder, "/", filename_stem, "_y_test_", k, ".txt"), sep=" ", header = F)
    
    bs_train_time <- system.time(bs <- bsnsing(X_train, y_train$V1, opt.solver = 'enum_c', node.size = nrow(y_train)^(1/4)))
    
    bs_train_elapsed <- bs_train_time[1]
    bs_summary <- summary(bs)
    bs_nleaves <- bs_summary$nleaves
    bs_depth <- max((bs_summary$nodes)['depth'])
    bs_accu_train <- bs_summary$accuracy
    y_pred <- predict(bs, newdata = X_test, type='class')
    score <- predict(bs, newdata = X_test)
    confmat <- table(y_test$V1,y_pred)
    TN <- confmat[1]
    TP <- confmat[4]
    FP <- confmat[3]
    FN <- confmat[2]
    f1 <- TP/(TP+(FN+FP)/2)
    accu <- (confmat[1] + confmat[4])/sum(confmat)
    auc <- ROC_func(data.frame(y_test$V1, score), 1, 2, pos.label = '1')
    outtext <- paste(filename_stem,
                     k,
                     format(accu, digits=5),
                     format(f1, digits=5),
                     format(auc, digits = 5),
                     format(bs_train_elapsed, digits=2),
                     format(bs_nleaves, digits=0),
                     format(bs_depth, digits=0),
                     format(bs_accu_train, digits=5),
                     sep=', ')
    cat(outtext)
    cat("\n")
  }
}

sink()

