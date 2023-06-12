library(dplyr)
library(xslt)
library(xml2)
library(mapview)

#' map_geographical_coverage
#'Make a map from EML
#' @param eml Metadata using EML standard in XML format
#'
#' @return A map
#' @export
map_geographical_coverage <- function(eml){
  name <- xml2::xml_find_all(eml, "//geographicCoverage/geographicDescription")
  name <- unlist(xml2::as_list(name))

  west <- xml2::xml_find_all(eml, "//geographicCoverage/boundingCoordinates/westBoundingCoordinate")
  west <- as.numeric(unlist(xml2::as_list(west)))

  east <- xml2::xml_find_all(eml, "//geographicCoverage/boundingCoordinates/eastBoundingCoordinate")
  east <- as.numeric(unlist(xml2::as_list(east)))

  north <- xml2::xml_find_all(eml, "//geographicCoverage/boundingCoordinates/northBoundingCoordinate")
  north <- as.numeric(unlist(xml2::as_list(north)))

  south <- xml2::xml_find_all(eml, "//geographicCoverage/boundingCoordinates/southBoundingCoordinate")
  south <- as.numeric(unlist(xml2::as_list(south)))

  geo_info <- data.frame(name = name,
                         west = west, east = east,
                         south = south, north = north)

  map <- leaflet::leaflet(geo_info) %>%
    leaflet::addProviderTiles("CartoDB.Positron") %>%
    leaflet::addRectangles(
      lng1 = west, lat1 = south,
      lng2 = east, lat2 = north,
      popup = name,
      fillColor = "transparent"
    )
  mapview::mapshot(map, url = "www/map.html", file = "www/map.png")
}

#' write_custom_css
#'Write a CSS
#' @param publish_mode Boolean
#'
#' @return a CSS file
#' @export
write_custom_css <- function(publish_mode){

  # get the css we always use
  main_css <- readLines("../template_emldown/main_custom.css")

  edu_css <- readLines("../template_emldown/educational_custom.css")

  writeLines(main_css, con = "custom.css")

  if(publish_mode){
    cat(edu_css, file= "www/custom.css", append = TRUE)
  }
}

##' Render EML metadata into a webpage
##'
##' Pass in an xml file of EML metadata and generate a nice webpage describing
##' the dataset.
##'
##' @title Render EML
##' @param file A valid Ecological Metadata Language file to be rendered to html.
##' @param open Whether to open the file in a browser. Defaults to TRUE.
##' @param outfile Name of output file.
##' @param publish_mode TRUE. If TRUE the website is pretty without warnings for weird stuff.
##' @param output_dir directory where will be stored the result file
##' @param encoding "" encoding of the EML file if necessary
##' @param map_img whether you want a image or an html map
##' @return HTML file containing dataset information
render_eml <- function(file, open = FALSE, outfile = "DataPaper.html",
                       publish_mode = TRUE, output_dir = "/docs",
                       encoding = "",map_img=FALSE) {
  eml <- xml2::read_xml(file, encoding = encoding)
  if (map_img){
    style <- xml2::read_xml("../template_emldown/bootstrap2.xsl")
  }else {
    style <- xml2::read_xml("../template_emldown/bootstrap.xsl")
  }
  html <- xslt::xml_xslt(eml, style)
  # make map
  map_geographical_coverage(eml)
  xml2::write_html(html, outfile)
  # add custom css
  write_custom_css(publish_mode)
  if (open == TRUE) {
    browseURL(outfile)

  }

}
