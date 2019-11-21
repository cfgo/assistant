library(shiny)
library(shinydashboard)
library(shinydashboardPlus)

mod_updateTabset <- function(
  input, output, session, triggerId, dashboardId, tab, parent
) {
  observeEvent(triggerId, {
    updateTabItems(parent, dashboardId, selected = tab)
  })
}

ui <- dashboardPagePlus(
  header = dashboardHeaderPlus(),
  sidebar = dashboardSidebar(
    sidebarMenu(
      id = 'Tabs', 
      menuItem("Tab 01", tabName = "tab01", icon = icon("dice-one")),
      menuItem("Tab 02", tabName = "tab02", icon = icon("dice-two"))
    )
  ),
  body = dashboardBody(
    tabItems(
      tabItem(
        tabName = "tab01",
        actionButton("updateButton", label = "To Tab02")
      ),
      tabItem(
        tabName = "tab02",
        h4("New Tab")
      )
    )
  )
)

server <- function(input, output, session) {
  callModule(
    mod_updateTabset,
    "updateLink",
    triggerId = input$updateButton,
    dashboardId = "Tabs", 
    tab = "tab02",
    parent = session
  )
}

shinyApp(ui = ui, server = server)