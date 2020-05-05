#cfgo_badge

#' Use livecycle badges in your documentation
#' 
#' Use badges in your function documentation to explain the current status
#' of the function.You can choose between four different badges: "experimental", 
#' "questioning ", "stable" and "deprecated". When to use which one while 
#' following the cfgo style is here explained \url{https://style.cfgo.de/lifecycle}.
#' 
#' Before you can use `cfgo_badge` in your source package you have to run 
#' `usethis::use_lifecycle()` in the console. This will create the directory
#' `figures/` in  `man/`. `figures` containes badge images in form of `.svg` 
#' files. Then you can create badges in your functions. If you want to add
#' for example the badge "questioning" in your documentation, just copy and paste
#' \cr\cr
#' `\\Sexpr[results=rd, stage=render]{assistant::cfgo_badge("questioning")}`
#' \cr\cr
#' into your documentation. To check if it works, you have to rebuild your 
#' source package (Ctrl+Shit+B). For the other badge options just replace 
#' `questioning` in the code.
#' 
#' @param stage 
#' choose one of "experimental", "questioning ", "stable" and 
#' "deprecated".
#' 
#' 
#' @example inst/examples/example_cfgo_badge.R
#'  
#' @export

cfgo_badge <- function(stage) {
  #Checks-------------------------------------------------------------------------
  cfgoTest::check_class(stage, "character", fun_name = "cfgo_badge")
  stage <- rlang::arg_match(stage, c("experimental", "questioning", "stable", 
                                     "deprecated"))
  #-------------------------------------------------------------------------------
  url <- paste0("https://www.tidyverse.org/lifecycle/#", stage)
  img <- cfgo_lifecycle_img(stage, url)
  
  sprintf("\\ifelse{html}{%s}{\\strong{%s}}", img, upcase1(stage))
}


cfgo_lifecycle_img <- function(stage, url) {
  #Checks-------------------------------------------------------------------------
  cfgoTest::check_class(stage, "character", fun_name = "cfgo_lifecycle_img")
  stage <- rlang::arg_match(stage, c("experimental", "questioning", "stable", 
                                     "deprecated"))
  cfgoTest::check_class(url, "character", fun_name = "cfgo_lifecycle_img")
  #-------------------------------------------------------------------------------  
  file <- sprintf("lifecycle-%s.svg", stage)
  stage_alt <- upcase1(stage)
  switch(stage,
         experimental = ,
         maturing = ,
         stable = ,
         questioning = ,
         retired = ,
         superseded = ,
         archived =
           sprintf(
             "\\out{<a href='%s'><img src='%s' alt='%s lifecycle'></a>}",
             url,
             file.path("figures", file),
             stage_alt
           )
         ,
         
         `soft-deprecated` = ,
         deprecated = ,
         defunct =
           sprintf(
             "\\figure{%s}{options: alt='%s lifecycle'}",
             file,
             stage_alt
           ),
         
         rlang::abort(sprintf("Unknown lifecycle stage `%s`", stage))
  )
}

upcase1 <- function(x) {
  substr(x, 1, 1) <- toupper(substr(x, 1, 1))
  x
}
