context("canvasXpress Web Charts - StackedPercent")


test_that("cXstackedpercent1", {
    check_ui_test(cXstackedpercent1())

    warning("when clicking on 'Sample1', the corresponding data is not disabled")
})

test_that("cXstackedpercent2", {
    check_ui_test(cXstackedpercent2())

    warning("when clicking on 'Sample1', the corresponding data is not disabled")
})

test_that("cXstackedpercent3", {
    check_ui_test(cXstackedpercent3())

    warning("when clicking on 'Sample1', the corresponding data is not disabled")
})

test_that("cXstackedpercent4", {
    check_ui_test(cXstackedpercent4())

    warning("when clicking on 'Big Fat Liar', the corresponding data is not disabled")
})
