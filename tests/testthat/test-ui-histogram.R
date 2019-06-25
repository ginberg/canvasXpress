context("canvasXpress Web Charts - Histogram")


test_that("cXhistogram1", {
    check_ui_test(cXhistogram1())

    warning("when clicking on legend item, the corresponding plot data is not disabled")
})

test_that("cXhistogram2", {
    check_ui_test(cXhistogram2())

    warning("when clicking on legend item, the corresponding plot data is not disabled")
})

test_that("cXhistogram3", {
    check_ui_test(cXhistogram3())

    warning("when clicking on legend item, the corresponding plot data is not disabled")
})
