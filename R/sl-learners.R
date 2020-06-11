# Also create a regular version with 4 threads.
SL.xgboost_fast = function(...) SuperLearner::SL.xgboost(nthread = get_cores(), ...)

# Multi-threaded ranger, when SL is single-core.
SL.ranger_fast = function(...) SuperLearner::SL.ranger(..., num.trees = 100, #min.node.size = 20L,
                                                       num.threads = get_cores())

SL.ranger_200 = function(...) SuperLearner::SL.ranger(..., num.trees = 200, #min.node.size = 20L,
                                                       num.threads = get_cores())

# Multi-threaded glmnet (if parallel backend is registered), when SL is single-core.
# TODO: currently using ck37r::SL.glmnet2, until it's merged with SuperLearner.
SL.glmnet_fast = function(...) ck37r::SL.glmnet2(..., parallel = TRUE)

# Clean up rpart object size.
SL.rpart2 = function(...) {
  result = SL.rpart(...)
  
  # Clear out a huge environment.
  environment(result$fit$object$terms) = NULL
  
  result
}

SL.glm2 = function(...) {
  # Run the normal GLM wrapper
  result = SL.glm(...)
  
  # Save the summary before we remove everything.
  result$fit$summary = capture.output(print(summary(result)))
  
  # Following http://www.win-vector.com/blog/2014/05/trimming-the-fat-from-glm-models-in-r/ 
  # Remove extra fit objects.
  result$fit$object$linear.predictors = NULL
  result$fit$object$weights = NULL
  result$fit$object$prior.weights = NULL
  result$fit$object$y = NULL
  result$fit$object$residuals = NULL
  result$fit$object$fitted.values = NULL
  result$fit$object$effects = NULL
  result$fit$object$qr$qr = NULL
  result$fit$object$data = NULL
  result$fit$object$family$variance = NULL
  result$fit$object$family$dev.resids = NULL
  result$fit$object$family$aic = NULL
  result$fit$object$family$validmu = NULL
  result$fit$object$family$simulate = NULL
  
  attr(result$fit$object$terms, ".Environment") = NULL
  attr(result$fit$object$formula, ".Environment") = NULL
  
  # This contains the full training data.
  result$fit$object$model = NULL
  
  result
}


SL.lm2 = function(...) {
  # Run the normal GLM wrapper
  result = SL.lm(...)
  
  # Save the summary before we remove everything.
  result$fit$summary = capture.output(print(summary(result)))
  
  # Following http://www.win-vector.com/blog/2014/05/trimming-the-fat-from-glm-models-in-r/ 
  # Remove extra fit objects.
  result$fit$object$linear.predictors = NULL
  result$fit$object$weights = NULL
  result$fit$object$prior.weights = NULL
  result$fit$object$y = NULL
  result$fit$object$residuals = NULL
  result$fit$object$fitted.values = NULL
  result$fit$object$effects = NULL
  result$fit$object$qr$qr = NULL
  result$fit$object$data = NULL
  result$fit$object$family$variance = NULL
  result$fit$object$family$dev.resids = NULL
  result$fit$object$family$aic = NULL
  result$fit$object$family$validmu = NULL
  result$fit$object$family$simulate = NULL
  
  attr(result$fit$object$terms, ".Environment") = NULL
  attr(result$fit$object$formula, ".Environment") = NULL
  
  # This contains the full training data.
  result$fit$object$model = NULL
  
  result
}