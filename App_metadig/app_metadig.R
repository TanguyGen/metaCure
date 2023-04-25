library(shiny)
library(xml2)
library(metadig)
library(ggplot2)
library(broman)
library(dplyr)
library(DT)
dirXML = "C:/Users/tangu/Desktop/Stage_meta/Curation/Curation/tests/checks"
suite = "C:/Users/tangu/Desktop/Stage_meta/Curation/Curation/tests/Suite.xml"

# Define UI ----
ui <- fluidPage(
  tags$head(includeCSS("www/styles.css")),  
  tags$head(tags$link(rel = "preconnect", href = "https://fonts.googleapis.com")),
  tags$head(tags$link(rel = "preconnect", href = "https://fonts.gstatic.com")),
  tags$head(tags$link(rel = "stylesheet", href="https://fonts.googleapis.com/css2?family=Manrope:wght@300&family=Roboto:wght@100&display=swap")) ,
  withTags({
    div(
      class = "header",
      checked = NA,
      h1(img(width=200,src="https://www.pndb.fr/static/images/PNDB_logo_bandeau.png",class="topleft")),
      h2("Assessment Report"),
      h3("FAIR score")
      
      
    )
  }),
  fluidRow(
    column(2,align='right',
           fileInput("file", h3("Select Metadata"),)
           ),
    column(4,align="center",
           plotOutput("barchart",width = "80%")
    ),
    column(4,
           plotOutput("piechart",width = "100%")
    )
  ),
  fluidRow(
    column(12, align='center',
           DTOutput("table")  
    )
  )
)


# Define server logic ----
# Define server logic ----
server <- function(input, output) {
  output$barchart <- renderPlot({
    try(Fair_scores(runSuite(suite, dirXML, input$file$datapath)), silent=TRUE)
  })
  
  output$piechart <- renderPlot({
    try(Fair_pie(runSuite(suite, dirXML, input$file$datapath)), silent=TRUE)
  })
  output$table <- renderDT({
    if (is.character(input$file$datapath)){
      data=Fair_table(runSuite(suite, dirXML, input$file$datapath))
       data %>%
        datatable(rownames= FALSE) %>%
        formatStyle(columns = 'Status', target='row',backgroundColor = styleEqual(
          unique(data$Status), c('lightgreen', '#fc6847',"#f5b42a")
        ))
    }
  })
}


# Run the app ----d

shinyApp(ui = ui, server = server)

