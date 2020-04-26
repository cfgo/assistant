# Instructions:
#
# 1) Save file as "test_name-of-tested-function" in inst\tinytest.
# 2) With Ctrl+F replace all "name-of-tested-function" with the actual function
#    name.
# 3) Paste here all variable names of the function, theire allowed classes and 
#      possible choices:
#   variable-name: allowed classes, choice options
#   variable-name: allowed classes, choice options
# 4) Replace "class-of-function-outcome" by the actual outcome class with Ctrl+F;
#     if there is more than one outcome class add the others by hand.
# 5) Finish the test script. The following remarks might help. Feel free to add 
#      remarks.
#   
#   `assistant::delete_all` deletes all breaks and spaces of a character value. 
#      This might be useful when using `expect_equal` on characters
#   
#    
#    
#    
# 5) Delete this and everythin above; test script finished :)

# No error and correct output for correct input---------------------------------

expect_silent(name-of-tested-function(variable = value))
expect_true(inherits(name-of-tested-function(variable = value), 
                     "class-of-function-outcome"))


#Error for wrong input----------------------------------------------------------

#name-of-tested-variable; forbidden input class
expect_error(name-of-tested-function(variable = forbidden-value))
err <- tryCatch(name-of-tested-function(variable = forbidden-value),
                error = function(err) err)
expect_true(rlang::inherits_all(
  err,c("name-of-tested-function_name-of-tested-variable_error", "rlang_error")
  ))
expect_equal(err, forbidden-value)
expect_equal(err, class-of-forbidden-value)
#name-of-tested-variable; none of the allowed options
expect_error(name-of-tested-function(variable = forbidden-value))
err <- tryCatch(name-of-tested-function(variable = forbidden-value),
                error = function(err) err)
expect_true(rlang::inherits_all(
  err,c("rlang_error", "error", "condition")
))


