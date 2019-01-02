context("canvasXpress Web Charts - Line")


test_that("cXline1", {
    check_ui_test(cXline1())

    warning("disabling Sample1 dots disables all 'Variable1' dots if 'Variable1' has been disabled/enabled before.")
})

test_that("cXline2", {
    check_ui_test(cXline2())

    warning("disabling Sample1 dots disables all 'Variable1' dots if 'Variable1' has been disabled/enabled before.")
})

test_that("cXline3", {
    check_ui_test(cXline3())
})
