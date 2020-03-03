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
    top_box_libraries     <- c("canvasXpress", "canvasXpress.data", "periscope", "shiny", "shinydashboard", "shinyBS", "DT", "htmlwidgets", "dplyr")

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

            # create shiny app
            # overwrite previous app
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
                for (file_name in c(ui_filename, global_filename, ui_body_filename, server_local_filename)) {
                    output_dir <- paste(test_app_location, "program", sep = usersep)
                    if (file_name == ui_filename) {
                        output_dir <- test_app_location
                    }
                    writeLines(readLines(con = system.file("test-app", file_name, package = "canvasXpress")),
                               con = paste(output_dir, file_name, sep = usersep))
                }
                file.remove(paste(test_app_location, "program", ui_sidebar_filename, sep = usersep))
                # Set libraries to show
                global_content <- readLines(con = paste(test_app_location, "program", global_filename, sep = usersep))
                top_box_libraries_string <- paste0("c('", paste(top_box_libraries, collapse = "','"), "')")
                global_content[length(global_content)] <- glue("g_top_box_libraries <- {top_box_libraries_string}")
                writeLines(global_content, con = paste(test_app_location, "program", global_filename, sep = usersep))


                # TODO add plot_functions to app
                # parse file -> list of functions that can be executed
                ui_functions_file <- readLines(con = "tests/cX-ui-functions.R")

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
