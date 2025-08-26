#' @export
mxjqshiny5 <- function(model, datax, lvl){
  explainer <- lime::lime(
    datax,
    lime::as_classifier(model, lvl)
  )
  explanation <- lime::explain(
    datax[nrow(datax),],
    explainer,
    n_labels = 3,
    n_features = ncol(datax)
  )
  return(explanation)
}
