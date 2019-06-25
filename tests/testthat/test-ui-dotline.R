context("canvasXpress Web Charts - DotLine")


test_that("cXdotline1", {
    check_ui_test(cXdotline1())

    warning("when clicking on 'Sample1', the corresponding data is not disabled/hidden")
})

test_that("cXdotline2", {
    check_ui_test(cXdotline2())

    warning("when clicking on 'Sample1', the corresponding data is not disabled/hidden")
})

test_that("cXdotline3 ", {
    check_ui_test(cXdotline3())

    warning("when clicking on 'Sample1', the corresponding data is not disabled/hidden")
})
