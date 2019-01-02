context("canvasXpress Web Charts - StackedLine")


test_that("cXstackedline1", {
    check_ui_test(cXstackedline1())

    warning("disabling Sample1 bar disables also 'Variable1' bars if 'Variable1' has been disabled/enabled before.")
})

test_that("cXstackedline2", {
    check_ui_test(cXstackedline2())

    warning("disabling Sample1 bar disables also 'Variable1' bars if 'Variable1' has been disabled/enabled before.")
})
