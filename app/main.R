box::use(
  bslib[page_sidebar, bs_theme, sidebar],
  shiny[moduleServer, NS, tags],
)

#' @export
ui <- function(id) {
  ns <- NS(id)
  
  page_sidebar(
    theme = app_theme(), 
    title = "Hex Matcher",
    sidebar = sidebar(
      
    )
  )
  
}

#' @export
server <- function(id) {
  moduleServer(id, function(input, output, session) {
    
  })
}

app_theme <- function() {
  bs_theme(
    version = 5
  )
}
