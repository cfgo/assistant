# stage = "experimental", "questioning ", "stable" and 
# "deprecated"
#url = "a"

#stage
################################################################################
#Correct input gives no error and expected output
expect_silent(cfgo_lifecycle_img(stage = "experimental" , url = "a"))
expect_true(inherits(
  cfgo_lifecycle_img(stage = "experimental" , url = "a"),
  "character"
  ))
expect_equal(
  cfgoTest::delete_space(cfgo_lifecycle_img(stage = "experimental" , url = "a")), 
  cfgoTest::delete_space(
    "\\out{<a href='a'><img src='figures/lifecycle-
    experimental.svg' alt='Experimental lifecycle'></a>}"
  )
)
expect_silent(cfgo_lifecycle_img(stage = "questioning" , url = "a"))
expect_true(inherits(
  cfgo_lifecycle_img(stage = "questioning" , url = "a"),
  "character"
))
expect_equal(
  cfgoTest::delete_space(cfgo_lifecycle_img(stage = "questioning" , url = "a")), 
  cfgoTest::delete_space(
    "\\out{<ahref='a'><imgsrc='figures/lifecycle-questioning.svg'alt=
    'Questioninglifecycle'></a>}"
  )
)
expect_silent(cfgo_lifecycle_img(stage = "stable" , url = "a"))
expect_true(inherits(
  cfgo_lifecycle_img(stage = "stable" , url = "a"),
  "character"
))
expect_equal(
  cfgoTest::delete_space(cfgo_lifecycle_img(stage = "stable" , url = "a")), 
  cfgoTest::delete_space(
    "\\out{<ahref='a'><imgsrc='figures/lifecycle-stable.svg'alt=
    'Stablelifecycle'></a>}"
  )
)
expect_silent(cfgo_lifecycle_img(stage = "deprecated" , url = "a"))
expect_true(inherits(
  cfgo_lifecycle_img(stage = "deprecated" , url = "a"),
  "character"
))
expect_equal(
  cfgoTest::delete_space(cfgo_lifecycle_img(stage = "deprecated" , url = "a")), 
  cfgoTest::delete_space(
    "\\figure{lifecycle-deprecated.svg}{options:alt=
    'Deprecatedlifecycle'}"
    
  )
)
#Input of Wrong class gives error
expect_error(cfgo_lifecycle_img(stage = 1 , url = "a"))
err <- tryCatch(cfgo_lifecycle_img(stage = 1 , url = "a"),
                error = function(err) err)
expect_true(rlang::inherits_all(
  err, c("cfgo_lifecycle_img_stage_error", "rlang_error")
  ))
#Input of correct class but not of the allowed options gives error
expect_error(cfgo_lifecycle_img(stage = "a" , url = "a"))
err <- tryCatch(cfgo_lifecycle_img(stage = "a" , url = "a"),
                error = function(err) err)
expect_true(rlang::inherits_all(err,c("rlang_error", "error", "condition")))


#url
################################################################################
#Correct input gives no error and expected output
expect_silent(cfgo_lifecycle_img(url = "a" , stage = "questioning"))
expect_true(inherits(
  cfgo_lifecycle_img(url = "a" , stage = "questioning"), 
  "character"
))
expect_equal(
  cfgoTest::delete_space(cfgo_lifecycle_img(stage = "questioning" , url = "a")), 
  cfgoTest::delete_space(
    "\\out{<ahref='a'><imgsrc='figures/lifecycle-questioning.svg'alt=
    'Questioninglifecycle'></a>}"
  )
)#Input of Wrong class gives error
expect_error(cfgo_lifecycle_img(url = 1 , stage = "questioning"))
err <- tryCatch(cfgo_lifecycle_img(url = 1 , stage = "questioning"),
                error = function(err) err)
expect_true(rlang::inherits_all(err,c("cfgo_lifecycle_img_url_error", "rlang_error")))


















