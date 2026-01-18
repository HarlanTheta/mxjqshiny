#' @export
mxjqshiny1 <- function(xname_ml, xname_ui, data4x, cw = 6){
  xi <- na.omit(data4x[[xname_ml]])
  if (is.numeric(xi)) {
    # coder wechat AuTrader
    column(
      width = cw,
      numericInput(
        inputId = xname_ml,
        label = xname_ui,
        value = max(xi),
        width = "100%"
      )
    )
  } else {
    column(
      width = cw,
      selectInput(
        inputId = xname_ml,
        label = xname_ui,
        choices = levels(xi),
        selected = levels(xi)[2],
        width = "100%"
      )
    )
  }
}
