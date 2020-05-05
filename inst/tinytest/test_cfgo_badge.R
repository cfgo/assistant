#stage
################################################################################
#Correct input gives no error and expected output
expect_silent(cfgo_badge(stage = "experimental" ))
expect_true(inherits(cfgo_badge(stage = "experimental" ), "character"))
expect_equal(
  cfgoTest::delete_space(cfgo_badge(stage = "experimental" )), 
  cfgoTest::delete_space(
    "\\ifelse{html}{\\out{<a href='https://www.tidyverse.org/lifecycle/
    #experimental'><img src='figures/lifecycle-experimental.svg' alt=
    'Experimental lifecycle'></a>}}{\\strong{Experimental}}"
  )
)
expect_silent(cfgo_badge(stage = "questioning" ))
expect_true(inherits(cfgo_badge(stage = "questioning" ), "character"))
expect_equal(
  cfgoTest::delete_space(cfgo_badge(stage = "questioning" )), 
  cfgoTest::delete_space(
    "\\ifelse{html}{\\out{<ahref='https://www.tidyverse.org/lifecycle/
    #questioning'><imgsrc='figures/lifecycle-questioning.svg'alt=
    'Questioninglifecycle'></a>}}{\\strong{Questioning}}"
  )
)
expect_silent(cfgo_badge(stage = "stable" ))
expect_true(inherits(cfgo_badge(stage = "stable" ), "character"))
expect_equal(
  cfgoTest::delete_space(cfgo_badge(stage = "stable" )), 
  cfgoTest::delete_space(
    "\\ifelse{html}{\\out{<ahref='https://www.tidyverse.org/lifecycle/#stable'>
    <imgsrc='figures/lifecycle-stable.svg'alt='Stablelifecycle'></a>}}
    {\\strong{Stable}}"
  )
)
expect_silent(cfgo_badge(stage = "deprecated" ))
expect_true(inherits(cfgo_badge(stage = "deprecated" ), "character"))
expect_equal(
  cfgoTest::delete_space(cfgo_badge(stage = "deprecated" )), 
  cfgoTest::delete_space(
    "\\ifelse{html}{\\figure{lifecycle-deprecated.svg}{options:alt=
    'Deprecatedlifecycle'}}{\\strong{Deprecated}}"
  )
)
#Input of Wrong class gives error
expect_error(cfgo_badge(stage = 1 ))
err <- tryCatch(cfgo_badge(stage = 1 ),
                error = function(err) err)
expect_true(rlang::inherits_all(err,c("cfgo_badge_stage_error", "rlang_error")))
#Input of correct class but not of the allowed options gives error
expect_error(cfgo_badge(stage = "a" ))
err <- tryCatch(cfgo_badge(stage = "a" ),
                error = function(err) err)
expect_true(rlang::inherits_all(err,c("rlang_error", "error", "condition")))


