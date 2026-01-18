#' @export
mxjqshiny5 <- function(model, datax, lvl){
  explainer <- lime::lime(
    datax,
    lime::as_classifier(model, lvl)
  )
  explanation <- lime::explain(
    datax[nrow(datax),], 
    # coder wechat AuTrader
    explainer, 
    n_labels = length(lvl), 
    n_features = ncol(datax)
  )
  return(explanation)
}