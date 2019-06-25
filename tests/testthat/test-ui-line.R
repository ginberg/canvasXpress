context("canvasXpress Web Charts - Line")


test_that("cXline1", {
    check_ui_test(cXline1())

    warning("when clicking on 'Sample1', the corresponding plot data is not disabled")
})

test_that("cXline2", {
    check_ui_test(cXline2())

    warning("when clicking on 'Sample1', the corresponding plot data is not disabled")
})

test_that("cXline3", {
    check_ui_test(cXline3())
})
