context("canvasXpress Web Charts - Oncoprint")


test_that("cXoncoprint1", {
    check_ui_test(cXoncoprint1())
})

test_that("cXoncoprint2", {
    check_ui_test(cXoncoprint2())
})

test_that("cXoncoprint3", {
    check_ui_test(cXoncoprint3())
})

test_that("cXoncoprint4", {
    check_ui_test(cXoncoprint4())

    warning("tooltip of DAB2 not equal to web example for TCGA:21-5782-01")
})
