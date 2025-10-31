#' @export
mxjqshiny7 <- function(model, data){
  set.seed(42)
  shapresult <- fastshap::explain(
    model, X = data,
    nsim = 10,
    adjust = T,
    # coder wechat AuTrader
    pred_wrapper = function(model, newdata){
      tem <- model$predict_newdata(newdata)
      tem$prob %>%
        as.data.frame() %>%
        pull(1)
    },
    newdata = as.data.frame(data[nrow(data),]),
    shap_only = F
  )
}
