###########################################################
### Test a classification model with testing features ###
###########################################################
test_rf <- function(train_dat, test_dat, par = NULL){
  ### Test an Random Forest model using processed features from testing images
  
  ### Input:
  ### - a data frame containing features and labels
  ### - a parameter list
  ### Output: trained model
  
  
  ### Train and Test with Random Forest
  if(is.null(par)){
    n = 10
    nodesize = 4
  } else {
    n = par$n
    nodesize = par$nodesize
  }
  
  rf_model <- randomForest::randomForest(train_dat[,-ncol(train_dat)], train_dat[,"y"],
                                         xtest = test_dat[,-ncol(test_dat)], ytest = test_dat[,"y"],
                                         ntree = n, nodesize = nodesize)
  pred <- rf_model$test$predicted
  return(pred = pred)
}
