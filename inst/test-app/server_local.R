# ----------------------------------------
# --       PROGRAM server_local.R       --
# ----------------------------------------
# USE: Session-specific variables and
#      functions for the main reactive
#      shiny server functionality.  All
#      code in this file will be put into
#      the framework inside the call to
#      shinyServer(function(input, output, session)
#      in server.R
#
# NOTEs:
#   - All variables/functions here are
#     SESSION scoped and are ONLY
#     available to a single session and
#     not to the UI
#
#   - For globally scoped session items
#     put var/fxns in server_global.R
#
# FRAMEWORK VARIABLES
#     input, output, session - Shiny
#     ss_userAction.Log - Reactive Logger S4 object
# ----------------------------------------

# -- IMPORTS --


# -- VARIABLES --


# -- FUNCTIONS --


# ----------------------------------------
# --          SHINY SERVER CODE         --
# ----------------------------------------

output$topBoxContent <- renderUI({
    html_text <- glue("<h3>{sessionInfo()$R.version$version.string}</h3>")
    html_text <- glue("{html_text} <table style = 'border-spacing:30px 0px;'> <tr> <th style='padding:5px 20px 5px 20px'>Package</th> <th>Version</th> </tr>")
    for (name in g_top_box_libraries) {
        html_text <- glue("{html_text} <tr><td style='padding:5px 20px 5px 20px'> {name} </td><td> {packageVersion(name)} </td></tr>")
    }
    html_text <- glue("{html_text} </table>")
    HTML(html_text)
})


output$tabContent <- renderUI({
    #TODO by script
})
