context("canvasXpress Web Charts - StackedPercentLine")


test_that("cXstackedpercentline1", {
    check_ui_test(cXstackedpercentline1())

    warning("disabling Sample1 bar disables also 'Variable1' bars if 'Variable1' has been disabled/enabled before.")
})

test_that("cXstackedpercentline2", {
    check_ui_test(cXstackedpercentline2())

    warning("disabling Sample1 bar disables also 'Variable1' bars if 'Variable1' has been disabled/enabled before.")
})
