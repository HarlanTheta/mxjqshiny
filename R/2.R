#' @export
mxjqshiny10 <- function (model, datax, datay, sampleat, whichc){
  predictor_model <-
    iml::Predictor$new(
      model,
      data = datax[-sampleat, ],
      y = datay, predict.function = function(model, newdata) {
        predict(model, newdata, type = "prob") %>%
          rename_with(~gsub(".pred_", "", .x)) %>%
          select(whichc)
  }, type = "prob")
  shap_model <-
    iml::Shapley$new(
      predictor_model,
      x.interest = datax[sampleat, ]
    )
  shap_model$results %>%
    mutate(pn = factor(sign(phi)),
           ps = abs(phi),
           feature.value = reorder(feature.value, ps)) %>%
    ggplot(aes(x = phi, y = feature.value, fill = pn)) +
    geom_col(show.legend = F) +
    geom_vline(xintercept = 0) +
    labs(x = "Shapley Value", y = "") +
    theme_minimal() +
    theme(text = element_text(size = 12))
}


