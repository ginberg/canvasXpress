context("canvasXpress Web Charts - Oncoprint")


test_that("cXoncoprint1", {
    check_ui_test(cXoncoprint1())

    warning("disabling Sample4 values disables also 'Variable1' values if 'Variable1' has been disabled/enabled before.")
})

test_that("cXoncoprint2", {
    check_ui_test(cXoncoprint2())

    warning("disabling Sample4 values disables also 'Variable1' values if 'Variable1' has been disabled/enabled before.")
})

test_that("cXoncoprint3", {
    check_ui_test(cXoncoprint3())

    warning("disabling Sample4 values disables also 'Variable1' values if 'Variable1' has been disabled/enabled before.")
})
