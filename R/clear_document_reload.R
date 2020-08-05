#' clear_document_reload
#'
#' @title clear, document and reload package
#' @details clear namespace by detaching all loaded packages document package 
#'   and reload development version.
#' 
#' @seealso \link[golem]{document_and_reload}
#' @export
#'
#' @examples 
#' \dontrun{
#'    document_and_reload()
#' }
clear_document_reload <- function() {
  
  # Detach all loaded packages and clean your environment
  all_attached <-  paste(
    "package:",
    names(utils::sessionInfo()$otherPkgs), 
    sep = ""
  )
  attempt::attempt(
    suppressWarnings(invisible(lapply(
      all_attached, 
      detach, 
      character.only = TRUE, 
      unload = TRUE
    ))), 
    silent = TRUE
  )
  
  rm(list = ls(envir = .GlobalEnv), envir = .GlobalEnv)
  
  # Document and reload your package
  pkg <- getwd()
  rstudioapi::documentSaveAll()
  roxygen2::roxygenise(package.dir = pkg)
  pkgload::load_all(pkg)
}