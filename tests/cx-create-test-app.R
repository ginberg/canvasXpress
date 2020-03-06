# Creates a shiny application from the canvasXpress testing ui functions (tests/cx-ui-functions.R).

if (interactive()) {
    suppressPackageStartupMessages({
        library(canvasXpress)
        library(periscope)
        library(dplyr)
        library(glue)
    })

    tests_location        <- "tests"
    test_app_name         <- "test_app"
    ui_filename           <- "ui.R"
    global_filename       <- "global.R"
    ui_body_filename      <- "ui_body.R"
    ui_sidebar_filename   <- "ui_sidebar.R"
    server_local_filename <- "server_local.R"
    css_filename          <- "custom.css"
    top_box_libraries     <- c("canvasXpress", "canvasXpress.data", "periscope", "shiny", "shinydashboard", "shinyBS", "DT", "htmlwidgets", "dplyr")
    plot_categories       <- c("Area", "AreaLine", "Bar", "BarLine", "Boxplot", "Bubble", "Chord", "Circular", "Contour", "Correlation", "Density", "Donnut", "DotLine",
                               "Dotplot", "Gantt", "Heatmap", "Histogram", "Kaplan-Meier", "Layout", "Line", "Map", "Network", "Non-Linear-Fit", "Oncoprint",
                               "ParallelCoordinates", "Pie", "Radar", "Sankey", "Scatter2D", "Scatter3D", "ScatterBubble2D", "Stacked", "StackedLine",
                               "StackedPercent", "StackedPercentLine", "Sunburst", "TCGA", "TagCloud", "Tree", "Treemap", "Venn", "Violin")

    # Checks if the location contains a periscope application.
    .is_periscope_app <- function(location = ".") {
        result <- TRUE
        if (!all(file.exists(file.path(location, c("server.R", "ui.R", "global.R", "program"))))) {
            result <- FALSE
        }
        result
    }

    tryCatch({
        if (!dir.exists(tests_location)) {
            warning("Test app creation could not proceed, location=<", location, "> does not exist!")
        }
        else {
            usersep <- .Platform$file.sep

            # create/overwrite shiny app
            test_app_location <- paste(tests_location, test_app_name, sep = usersep)
            if (file.exists(test_app_location)) {
                unlink(test_app_location, recursive = TRUE)
            }
            create_new_application("test_app", "tests", sampleapp = F, resetbutton = F, rightsidebar = F)

            # Check app dir exists
            if (!dir.exists(test_app_location)) {
                warning("Test app creation could not proceed, location=<", location, "> does not exist!")
            }
            else if (!.is_periscope_app(test_app_location)) {
                warning("Test app creation could not proceed, location=<", location, "> does not contain a valid periscope application!")
            }
            else {
                # overwrite template files
                for (file_name in c(ui_filename, global_filename, ui_body_filename, server_local_filename, css_filename)) {
                    output_dir <- paste(test_app_location, "program", sep = usersep)
                    if (file_name == ui_filename) {
                        output_dir <- test_app_location
                    } else if (file_name == css_filename) {
                        output_dir <- paste(test_app_location, "www", "css", sep = usersep)
                    }
                    writeLines(readLines(con = system.file("test-app", file_name, package = "canvasXpress")),
                               con = paste(output_dir, file_name, sep = usersep))
                }
                file.remove(paste(test_app_location, "program", ui_sidebar_filename, sep = usersep))
                # Set libraries to show
                global_content <- readLines(con = paste(test_app_location, "program", global_filename, sep = usersep))
                top_box_libraries_string <- paste0("c('", paste(top_box_libraries, collapse = "','"), "')")
                plot_categories_string   <- paste0("c('", paste(plot_categories, collapse = "','"), "')")

                global_content[length(global_content) + 1]     <- glue("g_top_box_libraries <- {top_box_libraries_string}")
                global_content[length(global_content) + 1] <- glue("g_plot_categories   <- {plot_categories_string}")
                writeLines(global_content, con = paste(test_app_location, "program", global_filename, sep = usersep))

                # parse file -> list of functions that can be executed
                ui_functions_file <- readLines(con = "tests/cX-ui-functions.R")
                writeLines(ui_functions_file, con = paste(test_app_location, "program", "fxn", "supporting_plots.R", sep = usersep))

                # add a tab for each plot category
                server_local_content <- readLines(con = paste(test_app_location, "program", server_local_filename, sep = usersep))
                plot_tabs_location   <- grep("#TODO plot-tabs", server_local_content)

                plot_category_counts <- list()
                for (i in 1:length(plot_categories)) {
                    plot_category  <- plot_categories[i]
                    cx_category_id <- glue("cX{gsub('-', '', tolower(plot_category))}")
                    max_index      <- max(grep(paste0(cx_category_id, "[0-9]+"), ui_functions_file))
                    plot_count     <- as.numeric(trimws(gsub(cx_category_id, "", (gsub("<.*", "", ui_functions_file[max_index])))))
                    plot_category_counts[[cx_category_id]] <- plot_count
                }
                plot_category_counts <- as.numeric(unlist(plot_category_counts))
                plot_category_counts_string <- paste0("c(", paste(plot_category_counts, collapse = ","), ")")

                plot_tabs_command <- paste0("tabs <- list(rep(0, length(g_plot_categories)))
                                           plot_counts <- ", plot_category_counts_string, "
                                           for (i in 1:length(g_plot_categories)) {
                                            plot_category           <- g_plot_categories[i]
                                            plot_category_formatted <- tolower(gsub(\"-\", \"\", g_plot_categories[i]))
                                            plot_count <- plot_counts[i]
                                            lapply(seq(plot_count), function(k) {
                                                plot_id           <- paste0(\"cX\", plot_category_formatted, k)
                                                output[[plot_id]] <- renderCanvasXpress({
                                                    plot_function <- getCurrentOutputInfo()$name
                                                    eval(parse(text = paste0(plot_function, \"()\")))
                                                 })
                                             })
                                             plot_outputs <- lapply(seq(plot_count), function(k) {
                                                tagList(tags$div(class = \"cxplotdiv\",
                                                                 tags$div(class = \"cxplotdivtext\", tags$b(paste0(\"cX\", plot_category_formatted, k))),
                                                                 canvasXpressOutput(paste0(\"cX\", plot_category_formatted, k), width = \"100%\")))
                                             })
                                             plot_category_link <- glue(\"https://canvasxpress.org/examples/{tolower(plot_category)}-1.html\")
                                             tabs[i] <- lapply(plot_category,
                                                               tabPanel,
                                                               tags$a(href = plot_category_link, target = \"_blank\", \"Plot Examples\"),
                                                               tags$hr(),
                                                               plot_outputs)
                                          }
                                          do.call(tabBox,
                                                 c(id  = \"outputTab\",
                                                   title    = NULL,
                                                   width    = 12,
                                                   selected = \"Area\",
                                                   tabs))")

                server_local_content[plot_tabs_location] <- paste0("eval(parse(text = '", plot_tabs_command, "'))")
                writeLines(server_local_content, con = paste(test_app_location, "program", server_local_filename, sep = usersep))

                message(glue("Shiny app generated in {test_app_location}"))
            }
        }
        warning = function(w) {
            warning(w$message, call. = FALSE)
        }
    })
} else {
    message("Setup not run - only can be run interactively")
}
