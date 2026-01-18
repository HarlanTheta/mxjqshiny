#' @export
mxjqshiny11 <- function (model, data, posi, type="force"){
  set.seed(42)
  shapresult <- fastshap::explain(
    model, 
    X = data, 
    nsim = 10, 
    adjust = T, 
    pred_wrapper = function(model, newdata) {
      predict(model, newdata, type = "prob") %>% 
        # coder wechat AuTrader
        select(all_of(paste0(".pred_", posi))) %>% 
        pull()
    }, 
    newdata = as.data.frame(data[nrow(data), ]), 
    shap_only = F
  )
  shapresult2 <- shapviz::shapviz(shapresult)
  if(type=="force"){
    shapviz::sv_force(shapresult2,
                      bar_label_size = 5,
                      annotation_size = 6) +
      theme(text = element_text(size = 15))
  } else if(type == "waterfall"){
    # coder wechat AuTrader
    shapviz::sv_waterfall(shapresult2,
                          bar_label_size = 5,
                          annotation_size = 6) +
      theme(text = element_text(size = 15))
  }
}