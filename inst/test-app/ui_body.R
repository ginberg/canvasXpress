# ----------------------------------------
# --          PROGRAM ui_body.R         --
# ----------------------------------------
# USE: Create UI elements for the
#      application body (right side on the
#      desktop; contains output) and
#      ATTACH them to the UI by calling
#      add_ui_body()
#
# NOTEs:
#   - All variables/functions here are
#     not available to the UI or Server
#     scopes - this is isolated
# ----------------------------------------

# -- IMPORTS --



# ----------------------------------------
# --      BODY ELEMENT CREATION         --
# ----------------------------------------

# -- Create Elements
body1 <- box(id          = 'topBox',
             title       = 'INFO (2020.03.02)',
             width       = 12,
             status      = 'primary',
             collapsible = T,
             collapsed   = T,
             uiOutput("topBoxContent"))

body2 <- uiOutput("tabContent")

# -- Register Elements in the ORDER SHOWN in the UI
add_ui_body(list(body1, body2))
