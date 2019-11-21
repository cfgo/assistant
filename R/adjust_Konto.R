#' adjust_Konto
#'
#' @title helps to generate correctly sized length of Sachkonten an 
#'   Personenkonten by adjusting string size for Mapping-Process
#'
#' @param x numer to adjust
#' @param length string length
#' @param pad fill numeric on right side with ...
#'
#' @return numeric
#' @export
adjust_Konto <- function(x, length, pad) {
  as.numeric(stringr::str_pad(
    x, width = length, side = "right", pad = as.character(pad)))
}
