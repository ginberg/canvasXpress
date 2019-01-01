context("canvasXpress Web Charts - DotLine")


test_that("cXdotline1", {
    check_ui_test(cXdotline1())

    warning("disabling Sample1 dots disables all 'Variable1' dots if 'Variable1' has been disabled/enabled before.")
})

test_that("cXdotline2", {
    check_ui_test(cXdotline2())

    warning("disabling Sample1 dots disables all 'Variable1' dots if 'Variable1' has been disabled/enabled before.")
})

test_that("cXdotline3 ", {
    check_ui_test(cXdotline3())

    warning("disabling Sample1 dots disables all 'Variable1' dots if 'Variable1' has been disabled/enabled before.")
})
