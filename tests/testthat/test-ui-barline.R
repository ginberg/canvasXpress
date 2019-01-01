context("canvasXpress Web Charts - BarLine")


test_that("cXbarline1", {
    check_ui_test(cXbarline1())

    warning("disabling Sample1 bar disables all 'Variable1' bars if 'Variable1' has been disabled/enabled before.")
})

test_that("cXbarline2", {
    check_ui_test(cXbarline2())

    warning("disabling Sample1 bar disables all 'Variable1' bars if 'Variable1' has been disabled/enabled before.")
})

test_that("cXbarline3", {
    check_ui_test(cXbarline3())

    warning("disabling Sample1 bar disables all 'Variable1' bars if 'Variable1' has been disabled/enabled before.")
})
