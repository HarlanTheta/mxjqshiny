#' @export
mxjqshiny8 <- function(model, datax, datay, sampleat){
  predictor_model <- iml::Predictor$new(
    model, 
    data = datax[-sampleat,],
    y = datay,
    predict.function = function(model, newdata){
      predict(model, newdata, type = "prob") %>%
        rename_with(~gsub(".pred_", "", .x))
    }, # coder wechat AuTrader
    type = "prob"
  )
  shap_model <- iml::Shapley$new(
    predictor_model, 
    x.interest = datax[sampleat,]
  )
  shap_model$results %>%
    # coder wechat AuTrader
    mutate(
      pn = factor(sign(phi)),
      ps = abs(phi),
      feature.value = tidytext::reorder_within(
        feature.value, ps, class
      )
    ) %>%
    ggplot(aes(x = phi, y = feature.value, fill = pn)) +
    geom_col(show.legend = F) +
    # geom_text(aes(label = round(phi, 4))) +
    geom_vline(xintercept = 0) +
    labs(x = "Shapley Value", y = "") +
    facet_wrap(~class, scale="free") +
    tidytext::scale_y_reordered() +
    theme_minimal() +
    theme(text = element_text(size = 19))
}

