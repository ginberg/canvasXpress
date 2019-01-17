# This is a reminder test to check the Data transformations (log2, log10, etc) in the plot. For each type of plot, these actions have to be performed manually!

context("canvasXpress manualTransformations")

barplot_y <- read.table(system.file("extdata", "cX-basic-dat.txt", package = "canvasXpress"), header = TRUE, sep = "\t", quote = "", row.names = 1, fill = TRUE, check.names = FALSE, stringsAsFactors = FALSE)
boxplot_y <- read.table(system.file("extdata", "cX-toothgrowth-dat.txt", package = "canvasXpress"), header = TRUE, sep = "\t", quote = "", row.names = 1, fill = TRUE, check.names = FALSE, stringsAsFactors = FALSE)
boxplot_x <- read.table(system.file("extdata", "cX-toothgrowth-smp.txt", package = "canvasXpress"), header = TRUE, sep = "\t", quote = "", row.names = 1, fill = TRUE, check.names = FALSE, stringsAsFactors = FALSE)

test_that("scatter2D manualTransformations", {

    check_ui_test(cXscatter2d13())
})

test_that("scatter3D manualTransformations", {

    check_ui_test(cXscatter3d1())

    fail("Transform: Percentile by variable crashes/freezes the plot")
})

test_that("barplot manualTransformations", {

    check_ui_test(cXbar5())
})

test_that("boxplot manualTransformations", {

    check_ui_test(cXboxplot1())
})

test_that("heatmap manualTransformations", {

    check_ui_test(cXheatmap1())
})

test_that("line manualTransformations", {

    y <- read.table(system.file("extdata", "cX-generic-dat.txt", package = "canvasXpress"), header = TRUE, sep = "\t", quote = "", row.names = 1, fill = TRUE, check.names = FALSE, stringsAsFactors = FALSE)
    x <- read.table(system.file("extdata", "cX-generic-smp.txt", package = "canvasXpress"), header = TRUE, sep = "\t", quote = "", row.names = 1, fill = TRUE, check.names = FALSE, stringsAsFactors = FALSE)

     result <- canvasXpress(
        data             = y,
        smpAnnot         = x,
        colorScheme      = "basic",
        graphOrientation = "vertical",
        graphType        = "Line",
        lineType         = "spline",
        showAnimation    = FALSE,
        title            = "Line manualTransformations")

     check_ui_test(result)
})

test_that("area manualTransformations", {

    check_ui_test(cXarea1())
})
