#' @export
mxjqshiny9 <- function(prefix = "apptheme"){
  shiny::addResourcePath(
    prefix = prefix,
    directoryPath = system.file("theme", package = "mxjqshiny")
  )
  shiny::tags$head(
    shiny::tags$link(
      rel = "stylesheet",
      type = "text/css",
      href = paste0(prefix, "/mxjqtheme.css")
    )
  )
}
