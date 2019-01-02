context("canvasXpress Web Charts - StackedPercent")


test_that("cXstackedpercent1", {
    check_ui_test(cXstackedpercent1())

    warning("disabling Sample1 bar disables also 'Variable1' bars if 'Variable1' has been disabled/enabled before.")
})

test_that("cXstackedpercent2", {
    check_ui_test(cXstackedpercent2())

    warning("disabling Sample1 bar disables also 'Variable1' bars if 'Variable1' has been disabled/enabled before.")
})

test_that("cXstackedpercent3", {
    check_ui_test(cXstackedpercent3())

    warning("disabling Sample1 bar disables also 'Variable1' bars if 'Variable1' has been disabled/enabled before.")
})

test_that("cXstackedpercent4", {
    check_ui_test(cXstackedpercent4())

    warning("disabling 'Honest Abe' bar disables also 'True' category bars if 'True' has been disabled/enabled before.")
})
