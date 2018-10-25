context("canvasXpress regressionLines")

y=read.table("http://www.canvasxpress.org/data/cX-ageheightt-dat.txt", header=TRUE, sep="\t", quote="", row.names=1, fill=TRUE, check.names=FALSE, stringsAsFactors=FALSE)
x=read.table("http://www.canvasxpress.org/data/cX-ageheightt-smp.txt", header=TRUE, sep="\t", quote="", row.names=1, fill=TRUE, check.names=FALSE, stringsAsFactors=FALSE)

test_that("scatterplot overall regressionLine", {

    result <-  canvasXpress(
        data                    = y,
        smpAnnot                = x,
        graphType               = "Scatter2D",
        title                   = "Scatterplot - regressionLine",
        afterRender             = list(list("addRegressionLine"))
    )
    check_ui_test(result)
})

test_that("scatterplot per-sample regressionLine", {

    result <-  canvasXpress(
        data                    = y,
        smpAnnot                = x,
        graphType               = "Scatter2D",
        title                   = "Scatterplot - regressionLine",
        afterRender             = list(list("addRegressionLine"))
    )
    check_ui_test(result)
})

test_that("scatterplot per variable regressionLine", {

    result <-  canvasXpress(
        data                    = y,
        smpAnnot                = x,
        graphType               = "Scatter2D",
        title                   = "Scatterplot - regressionLine",
        afterRender             = list(list("addRegressionLine"))
    )
    check_ui_test(result)
})

# segregate the chart per sample and variable and have a regression line for each
test_that("scatterplot per variable and sample regressionLine", {

    result <-  canvasXpress(
        data                    = y,
        smpAnnot                = x,
        graphType               = "Scatter2D",
        title                   = "Scatterplot - regressionLine",
        afterRender             = list(list("addRegressionLine"))
    )
    check_ui_test(result)
})

