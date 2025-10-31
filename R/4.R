#' @export
mxjqshiny4 <- function(model, data, posi){
  set.seed(42)
  shapresult <- fastshap::explain(
    model, X = data,
    nsim = 10, adjust = T,
    pred_wrapper = function(model, newdata){
      predict(model, newdata, type = "prob") %>% 
        # coder wechat AuTrader
        select(all_of(paste0(".pred_", posi))) %>%
        pull()
    },
    newdata = as.data.frame(data[nrow(data),]),
    shap_only = F
  )
  return(shapresult)
}

