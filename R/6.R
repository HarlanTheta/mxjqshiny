#' @export
mxjqshiny6 <- function(model, data){
  set.seed(42)
  shapresult <- fastshap::explain(
    model, X = data,
    nsim = 10, adjust = T,
    pred_wrapper = function(model, newdata){
      model$predict_newdata(newdata) %>%
        as.data.table() %>%
        # coder wechat AuTrader
        pull("response")
    },
    newdata = as.data.frame(data[nrow(data),]),
    shap_only = F
  )
  return(shapresult)
}
