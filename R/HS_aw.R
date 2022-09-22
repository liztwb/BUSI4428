#' VaR and ES using Age-weighted HS
#'
#' @param r a vector of returns
#' @param P portfolio value
#' @param lam lambda - the weighting parameter
#' @param cl confidence level for VaR and ES
#'
#' @return a vector containing VaR and ES
#' @export
#'
#' @examples
#'  x <- rnorm(100)
#'  HS_aw(x)
HS_aw <- function(r, P = 1000, lam = 0.98, cl = 0.95){
  alpha <- 1-cl
  n <- length(r)
  df <- data.frame(age = seq(n,1), r, loss = -P*r)
  df$w <- with(df,((1-lam)*lam^(age-1))/(1-lam^n))
  df <- df[order(df$loss, decreasing = TRUE),]
  df$cumw <- with(df, cumsum(w))
  VaR <- df[which.min(abs(df$cumw - alpha)),'loss']
  df2 <- df[df$loss > VaR,]
  df2$nw <- with(df2, w/sum(w))
  ES <- with(df2, sum(nw * loss))
  res.vec <- c(VaR = VaR, ES = ES)
  names(res.vec) <- paste0(names(res.vec),100*cl)
  return(res.vec)
}
