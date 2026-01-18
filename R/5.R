#' @export
mxjqshiny3 <- function(model, data){
  set.seed(42)
  shapresult <- fastshap::explain(
    model, 
    X = data,
    nsim = 10, 
    adjust = T,
    pred_wrapper = function(model, newdata){
      predict(model, newdata) %>% 
        pull()
      # coder wechat AuTrader
    },
    newdata = as.data.frame(data[nrow(data),]),
    shap_only = F
  )
  return(shapresult)
}

