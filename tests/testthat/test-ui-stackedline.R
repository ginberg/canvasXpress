context("canvasXpress Web Charts - StackedLine")


test_that("cXstackedline1", {
    check_ui_test(cXstackedline1())

    warning("when clicking on 'Sample1', the corresponding data is not disabled/hidden")
})

test_that("cXstackedline2", {
    check_ui_test(cXstackedline2())

    warning("when clicking on 'Sample1', the corresponding data is not disabled/hidden")
})
