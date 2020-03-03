# ----------------------------------------
# --          PROGRAM global.R          --
# ----------------------------------------
# USE: Global variables and functions
#
# NOTEs:
#   - All variables/functions here are
#     globally scoped and will be available
#     to server, UI and session scopes
# ----------------------------------------


# -- Setup your Application --
set_app_parameters(title = "CanvasXpress Test Application",
                   titleinfo = NULL,
                   loglevel = "DEBUG",
                   showlog = FALSE,
                   app_version = "1.0.0")

# -- PROGRAM --

g_top_box_libraries <- c("canvasXpress", "canvasXpress.data", "periscope", "shiny", "shinydashboard", "shinyBS", "DT", "htmlwidgets", "dplyr")
