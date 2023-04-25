library(shiny)
library(xml2)
library(metadig)
library(ggplot2)
library(broman)
library(dplyr)
dirXML="."
suite="../Suite.xml"
metadataFile <-"../Reef_Life_Survey_Fish_Mediterranean_sample.xml"

metadataFile2 <- "../Assessing_the_importance_of_field_margins_for_bat_species_and_communities_in_intensive_agricultural_landscapes_-_Data.xml"

metadataFile3 <- "../edi.300.6.xml"

# Define UI ----
ui <- fluidPage(
  titlePanel("FAIR Assessment Report", windowTitle = "PNDB FAIR report"),
  
  sidebarLayout(
    sidebarPanel(fileInput("file", h3("Select Metadata"))),
    mainPanel(plotOutput("barchart"),plotOutput("piechart"))
    )
  )


# Define server logic ----
# Define server logic ----
server <- function(input, output) {
  output$barchart <- renderPlot({
    Fair_scores(runSuite(suite,".",input$file$datapath))
  })
  output$piechart <- renderPlot({
    Fair_pie(runSuite(suite,".",input$file$datapath))
  })
}

# Run the app ----d

shinyApp(ui = ui, server = server)
