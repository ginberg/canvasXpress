context("canvasXpress LegendPosition")

default_legend_position <- "right"
all_legend_positions    <- c("topRight", "right", "bottomRight", "bottom", "bottomLeft", "left", "topLeft", "top")
test_legend_positions   <- setdiff(all_legend_positions, default_legend_position)
test_sample_size        <- 3

get_sample_legend_positions <- function() {
    sample(test_legend_positions, test_sample_size)
}

test_that("scatterplot legendposition", {

    y <- read.table("http://www.canvasxpress.org/data/cX-mtcars-dat.txt", header = TRUE, sep = "\t", quote = "", row.names = 1, fill = TRUE, check.names = FALSE, stringsAsFactors = FALSE)
    legend_inside <- FALSE
    for (legend_pos in get_sample_legend_positions()) {
        result <-  canvasXpress(
            data                    = y,
            asSampleFactors         = list("cyl"),
            colorBy                 = "cyl",
            graphType               = "Scatter2D",
            stringVariableFactors   = list("cyl"),
            title                   = paste("Scatterplot - LegendPosition", legend_pos),
            legendPosition          = legend_pos,
            legendInside            = legend_inside
        )
        check_ui_test(result)
        Sys.sleep(5)
    }
})

test_that("barplot legendposition", {

    y <- read.table("http://www.canvasxpress.org/data/cX-basic-dat.txt", header = TRUE, sep = "\t", quote = "", row.names = 1, fill = TRUE, check.names = FALSE, stringsAsFactors = FALSE)
    legend_inside <- TRUE
    for (legend_pos in get_sample_legend_positions()) {
        result <-  canvasXpress(
            data                    = y,
            graphOrientation        = "vertical",
            graphType               = "Bar",
            title                   = paste("Barplot - LegendPosition", legend_pos),
            legendPosition          = legend_pos,
            legendInside            = legend_inside
        )
        check_ui_test(result)
        Sys.sleep(5)
    }
})

test_that("boxplot legendposition", {

    y <- read.table("http://www.canvasxpress.org/data/cX-toothgrowth-dat.txt", header = TRUE, sep = "\t", quote = "", row.names = 1, fill = TRUE, check.names = FALSE, stringsAsFactors = FALSE)
    x <- read.table("http://www.canvasxpress.org/data/cX-toothgrowth-smp.txt", header = TRUE, sep = "\t", quote = "", row.names = 1, fill = TRUE, check.names = FALSE, stringsAsFactors = FALSE)
    legend_inside            <- FALSE
    for (legend_pos in get_sample_legend_positions()) {
        result <-  canvasXpress(
            data                    = y,
            smpAnnot                = x,
            colorBy                 = "dose",
            graphOrientation        = "vertical",
            graphType               = "Boxplot",
            groupingFactors         = list("dose"),
            showLegend              = TRUE,
            smpTitle                = "dose",
            stringSampleFactors     = list("dose"),
            title                   = paste("Boxplot - LegendPosition", legend_pos),
            legendPosition          = legend_pos,
            legendInside            = legend_inside
        )

        check_ui_test(result)
        Sys.sleep(5)
    }
})

test_that("dotplot legendposition", {

    y <- read.table("http://www.canvasxpress.org/data/cX-iris-dat.txt", header = TRUE, sep = "\t", quote = "", row.names = 1, fill = TRUE, check.names = FALSE, stringsAsFactors = FALSE)
    x <- read.table("http://www.canvasxpress.org/data/cX-iris-smp.txt", header = TRUE, sep = "\t", quote = "", row.names = 1, fill = TRUE, check.names = FALSE, stringsAsFactors = FALSE)

    legend_inside            <- TRUE
    for (legend_pos in get_sample_legend_positions()) {
        result <-  canvasXpress(
            data                    = y,
            smpAnnot                = x,
            graphOrientation        = "vertical",
            graphType               = "Dotplot",
            afterRender             = list(list("groupSamples", list("Species"))),
            title                   = paste("Dotplot - LegendPosition", legend_pos),
            legendPosition          = legend_pos,
            legendInside            = legend_inside
        )

        check_ui_test(result)
        Sys.sleep(5)
    }
})

test_that("heatmap legendposition", {

    y=read.table("http://www.canvasxpress.org/data/cX-heatmapR-dat.txt", header=TRUE, sep="\t", quote="", row.names=1, fill=TRUE, check.names=FALSE, stringsAsFactors=FALSE)
    x=read.table("http://www.canvasxpress.org/data/cX-heatmapR-smp.txt", header=TRUE, sep="\t", quote="", row.names=1, fill=TRUE, check.names=FALSE, stringsAsFactors=FALSE)
    z=read.table("http://www.canvasxpress.org/data/cX-heatmapR-var.txt", header=TRUE, sep="\t", quote="", row.names=1, fill=TRUE, check.names=FALSE, stringsAsFactors=FALSE)

    legend_inside <- FALSE
    for (legend_pos in get_sample_legend_positions()) {
        result <-  canvasXpress(
            data                    = y,
            smpAnnot                = x,
            varAnnot                = z,
            colorBy                 = "dose",
            graphType               = "Heatmap",
            title                   = paste("Heatmap - LegendPosition", legend_pos),
            legendPosition          = legend_pos,
            legendInside            = legend_inside
        )

        check_ui_test(result)
        Sys.sleep(5)
    }
})
