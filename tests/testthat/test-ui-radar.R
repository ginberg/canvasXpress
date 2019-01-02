context("canvasXpress Web Charts - Radar")


test_that("cXradar1", {
    check_ui_test(cXradar1())

    warning("disabling Sample1 dots disables also 'Variable1' dots if 'Variable1' has been disabled/enabled before.")
})

test_that("cXradar2", {
    check_ui_test(cXradar2())

    warning('radar has brown overlay on mouseover (if plot is not resized) - RStudio Viewer')
    warning("disabling Sample1 area disables also 'Variable1' area if 'Variable1' has been disabled/enabled before.")
})

test_that("cXradar3", {
    check_ui_test(cXradar3())

    warning("disabling Sample1 area disables also 'Variable1' area if 'Variable1' has been disabled/enabled before.")
})

test_that("cXradar4", {
    check_ui_test(cXradar4())

    warning("disabling Sample1 dots disables also 'Variable1' dots if 'Variable1' has been disabled/enabled before.")
})

test_that("cXradar5", {
    check_ui_test(cXradar5())

    warning("disabling Sample1 area disables also 'Variable1' area if 'Variable1' has been disabled/enabled before.")
})

test_that("cXradar6", {
    check_ui_test(cXradar6())
})

test_that("cXradar7", {
    check_ui_test(cXradar7())
})

test_that("cXradar8", {
    check_ui_test(cXradar8())
})
