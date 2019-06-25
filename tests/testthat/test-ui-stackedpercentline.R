context("canvasXpress Web Charts - StackedPercentLine")


test_that("cXstackedpercentline1", {
    check_ui_test(cXstackedpercentline1())

    warning("when clicking on 'Sample1', the corresponding data is not disabled/hidden")
})

test_that("cXstackedpercentline2", {
    check_ui_test(cXstackedpercentline2())

    warning("when clicking on 'Sample1', the corresponding data is not disabled/hidden")
})
