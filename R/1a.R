#' @export
mxjqshiny1a <- function (xname_ml, xname_ui, data4x, cw = 6){
  xi <- na.omit(data4x[[xname_ml]])
  if (is.numeric(xi)) {
    column(
      width = cw, 
      numericInput(inputId = xname_ml,
                   label = xname_ui, 
                   value = as.numeric(data4example[[xname_ml]]), 
                   width = "100%")
    )
  }
  else {
    column(
      width = cw, 
      selectInput(inputId = xname_ml,
                  label = xname_ui, 
                  choices = levels(xi), 
                  selected = data4example[[xname_ml]],
                  width = "100%")
    )
  }
}