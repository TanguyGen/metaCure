library(shiny)
library(xml2)
library(metadig)
library(ggplot2)
library(broman)
library(dplyr)
library(DT)

source("C:/Users/tangu/Desktop/metaCure/metaCure/R/Function_url_exists.R")
source("C:/Users/tangu/Desktop/metaCure/metaCure/R/Fair_representation.R")
source("C:/Users/tangu/Desktop/metaCure/metaCure/R/eml_down.R")
setwd("C:/Users/tangu/Desktop/metaCure/metaCure/App_metadig")
dirXML = "C:/Users/tangu/Desktop/metaCure/metaCure/checks"
suite = "../Suite/Suite.xml"

# Define UI ----
ui <- fluidPage(
  tags$head(includeCSS("www/styles.css")),
  tags$head(
    tags$link(rel = "preconnect", href = "https://fonts.googleapis.com")
  ),
  tags$head(
    tags$link(rel = "preconnect", href = "https://fonts.gstatic.com")
  ),
  tags$head(
    tags$link(rel = "stylesheet", href = "https://fonts.googleapis.com/css2?family=Manrope:wght@300&family=Roboto:wght@100&display=swap")
  ) ,
  withTags({
    div(
      class = "header",
      checked = NA,
      h1(
        img(
          width = 200,
          src = "https://www.pndb.fr/static/images/PNDB_logo_bandeau.png",
          class = "topleft"
        )
      ),
      h2("Assessment Report"),
      h3("FAIR score")
    )
  }),
  navbarPage(
    "Menu",
    tabPanel("Upload data",
             div(class = "button",
                 fileInput(
                   "file", h3("Select Metadata"), width = "40%"
                 ))),
    tabPanel("Draft of Data Paper",htmlOutput("html") ),
    tabPanel("Fair Assessment",
             plotOutput("barchart", width = "80%"),
            plotOutput("piechart", width = "100%"),
            DTOutput("table")
             )
  )
)


# Define server logic ----
# Define server logic ----
server <- function(input, output) {
  output$barchart <- renderPlot({
    try(Fair_scores(runSuite(suite, dirXML, input$file$datapath)), silent =
          TRUE)
  })
  
  output$piechart <- renderPlot({
    try(Fair_pie(runSuite(suite, dirXML, input$file$datapath)), silent =
          TRUE)
  })
  output$table <- renderDT({
    if (is.character(input$file$datapath)) {
      data<-Fair_table(runSuite(suite, dirXML, input$file$datapath))
      data <-data %>%
        datatable(rownames = FALSE) %>%
        formatStyle(
          columns = 'Status',
          target = 'row',
          backgroundColor = styleEqual(
            unique(data$Status),
            c('#fc6847','lightgreen', "#f5b42a")
          )
        )
      
    }
  })
  output$html <- renderUI({
    try(includeHTML(render_eml(input$file$datapath)))
    
  })
}


# Run the app ----d

shinyApp(ui = ui, server = server)
