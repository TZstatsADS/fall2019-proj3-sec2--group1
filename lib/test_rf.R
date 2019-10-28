###########################################################
### Test a classification model with training features ###
###########################################################
test_rf <- function(train_dat, test_dat, par = NULL){
  ### Test an Random Forest model using processed features from training images
  
  ### Input:
  ### - a data frame containing features and labels
  ### - a parameter list
  ### Output: trained model
  
  
  ### Train with SVM
  if(is.null(par)){
    n = 10
  } else {
    n = par$n
  }
  
  rf_model <- randomForest::randomForest(train_dat[,-1], train_dat[,"y"],
                                          xtest = test_dat[,-1], ytest = test_dat[,"y"],
                                          ntree = n)
  
  return(model = rf_model)
}
