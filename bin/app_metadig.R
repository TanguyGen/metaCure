library(shiny)
library(xml2)
library(metadig)
library(ggplot2)
library(broman)
library(ragtop)
library(dplyr)
dir<-rstudioapi::getSourceEditorContext()$path
setwd(dir)
utils::getSrcDirectory
setwd("~/GitHub/metacure/bin/")
rstudioapi::getSourceEditorContext()$path

dirXML="."
suite="../Suite/Suite.xml"
metadataFile <-"../ex_data/Reef_Life_Survey_Fish_Mediterranean_sample.xml"

metadataFile2 <- "../ex_data/Assessing_the_importance_of_field_margins_for_bat_species_and_communities_in_intensive_agricultural_landscapes_-_Data.xml"

metadataFile3 <- "../ex_data/edi.300.6.xml"

if(!exists("foo", mode="function")) source("../R/eml_down.R")
if(!exists("foo2", mode="function")) source("../R/Fair_representation.R")
if(!exists("foo3", mode="function")) source("../R/Function_url_exists.R")


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
