context("canvasXpress Charts - Differentiated groups")

y <- read.table(system.file("extdata", "cX-toothgrowth-dat.txt", package = "canvasXpress"), header = TRUE, sep = "\t", quote = "", row.names = 1, fill = TRUE, check.names = FALSE, stringsAsFactors = FALSE)
x <- read.table(system.file("extdata", "cX-toothgrowth-smp.txt", package = "canvasXpress"), header = TRUE, sep = "\t", quote = "", row.names = 1, fill = TRUE, check.names = FALSE, stringsAsFactors = FALSE)

test_that("segregation ordering - Samples", {
    result <- canvasXpress(data                    = y,
                           smpAnnot                = x,
                           graphOrientation        = "vertical",
                           graphType               = "Boxplot",
                           colorBy                 = "supp",
                           groupingFactors         = list("dose", "supp"),
                           showBoxplotOriginalData = TRUE,
                           showLegend              = TRUE,
                           smpLabelRotate          = 90,
                           smpTitle                = "Dose",
                           title                   = "Grouping by 3 doses and 2 supps, should look like 3 groups of boxplots",
                           xAxisTitle              = "len")

    check_ui_test(result)

    fail("Boxplots grouping doesn't look good (looks like 6 separate boxplots)")
})
