#' @export
mxjqshiny2 <- function(input, trainx, traindf, xat){
  new_sample <-
    data.frame(matrix(NA, nrow = 1, ncol = length(trainx)))
  for (i in seq_along(trainx)) {
    valuei <- input[[trainx[i]]]
    # coder wechat AuTrader
    new_sample[1, i] <- valuei
  }
  names(new_sample) <- trainx
  new_sample <- new_sample %>%
    select(colnames(traindf)[xat])
  traindf2 <- rbind(traindf[,xat], new_sample)
  return(list(new = new_sample, new2 = traindf2))
}