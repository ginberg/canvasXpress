context("canvasXpress Web Charts - BarLine")


test_that("cXbarline1", {
    check_ui_test(cXbarline1())

    warning("when clicking on 'Sample1', the corresponding data is not disabled/hidden")
})

test_that("cXbarline2", {
    check_ui_test(cXbarline2())

    warning("when clicking on 'Sample1', the corresponding data is not disabled/hidden")
})

test_that("cXbarline3", {
    check_ui_test(cXbarline3())

    warning("when clicking on 'Sample1', the corresponding data is not disabled/hidden")
})
