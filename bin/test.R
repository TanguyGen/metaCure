library(metadig)
setwd("C:/Users/tangu/Desktop/Stage_meta/Curation/Curation/tests/checks")

metadataFile <-"../Reef_Life_Survey_Fish_Mediterranean_sample.xml"
  
metadataFile2 <- "../Assessing_the_importance_of_field_margins_for_bat_species_and_communities_in_intensive_agricultural_landscapes_-_Data.xml"
suite<-"../Suite.xml"

metadataFile3 <- "../edi.300.6.xml"

checkFile <- "abstract.100.words.xml"
results <- runCheck(checkFile, metadataFile)
results


checkFile <- "Publication_date_check.xml"
results <- runCheck(checkFile, metadataFile)
results

checkFile <- "keywords.presence.xml"
results <- runCheck(checkFile, metadataFile)
results

checkFile <- "keywords.control.xml"
results <- runCheck(checkFile, metadataFile)
results

checkFile <- "creator.xml"
results <- runCheck(checkFile, metadataFile)
results


checkFile <- "creatorID.xml"
results <- runCheck(checkFile, metadataFile)
results

checkFile <- "Spatial_extent.xml"
results <- runCheck(checkFile, metadataFile)
results

checkFile <- "Temporal_extent.xml"
results <- runCheck(checkFile, metadataFile)
results

checkFile <- "entity.id.xml"
results <- runCheck(checkFile, metadataFile)
results

checkFile <- "entity.id.type.xml"
results <- runCheck(checkFile, metadataFile)
results

checkFile <- "Taxonomic_extent.xml"
results <- runCheck(checkFile, metadataFile)
results

checkFile <- "Spatial_extent_description.xml"
results <- runCheck(checkFile, metadataFile)
results

checkFile <- "Distribution_contact.xml"
results <- runCheck(checkFile, metadataFile)
results

checkFile <- "distribution.id.present.xml" 
results <- runCheck(checkFile, metadataFile)
results

checkFile <- "Attributes_definitions.xml" 
results <- runCheck(checkFile, metadataFile2)
results

checkFile <- "attribute.scale.xml"
results <- runCheck(checkFile, metadataFile)
results

checkFile <- "attribute.names.differ.xml"
results <- runCheck(checkFile, metadataFile)
results

checkFile <- "Attributes_definitions_3words.xml"
results <- runCheck(checkFile, metadataFile)
results

checkFile <- "AttributeList.xml"
results <- runCheck(checkFile, metadataFile)
results

checkFile <- "attribute.unique.xml"
results <- runCheck(checkFile, metadataFile)
results

checkFile <- "lengthTitle.xml"
results <- runCheck(checkFile, metadataFile)
results

checkFile <- "metadata.id.present.xml"
results <- runCheck(checkFile, metadataFile)
results

checkFile <- "metadata.id.resolvable.xml"
results <- runCheck(checkFile, metadataFile)
results

checkFile <- "storage_type.xml"
results <- runCheck(checkFile, metadataFile)
results

checkFile <- "entity.type.present.xml"
results <- runCheck(checkFile, metadataFile)
results

checkFile <- "entity.name.xml"
results <- runCheck(checkFile, metadataFile)
results

checkFile <- "entity.description.xml"
results <- runCheck(checkFile, metadataFile)
results

checkFile <- "ressource_license.xml"
results <- runCheck(checkFile, metadataFile)
results

checkFile <- "keyword.type.xml"
results <- runCheck(checkFile, metadataFile)
results

checkFile <- "entity.format.xml"
results <- runCheck(checkFile, metadataFile)
results

checkFile <- "entity.id.xml"
results <- runCheck(checkFile, metadataFile)
results

checkFile <- "entity.id.type.xml"
results <- runCheck(checkFile, metadataFile)
results

checkFile <- "RevisionCreationDate.xml" #étonnant car selon dataOne ils en ont
results <- runCheck(checkFile, metadataFile)
results

checkFile <- "publisher.present.xml"
results <- runCheck(checkFile, metadataFile)
results

checkFile <- "publisher.ID.xml"
results <- runCheck(checkFile, metadataFile)
results

#Services dispo sur ISO mais pas sur EML ? Seul Iso sont rechechés dans les fonctions

checkFile <- "domain.names.definition.xml"
results <- runCheck(checkFile, metadataFile)
results

checkFile <- "method.present.xml"
results <- runCheck(checkFile, metadataFile)
results

checkFile <- "trace.information.xml"
results <- runCheck(checkFile, metadataFile)
results


checkFile <- "checksum.present.xml"
results <- runCheck(checkFile, metadataFile)
results

checkFile <- "attribute.unit.xml"
results <- runCheck(checkFile, metadataFile)
results

checkFile <- "entity.attribute.precision.xml"
results <- runCheck(checkFile, metadataFile)
results

checkFile <- "provenance.processStepCode.present.xml"
results <- runCheck(checkFile, metadataFile)
results

checkFile <- "ressource.landing.page.xml"
results <- runCheck(checkFile, metadataFile)
results

checkFile <- "entity.format.nonproprietary.xml"
results <- runCheck(checkFile, "C:/Users/tangu/Desktop/Stage_meta/Curation/Curation/tests/CoastWIBE_database_Coastal_Water_Interdisciplinarity_Biomarkers.xml")
results

checkFile <- "attribute.domain.present.xml"
results <- runCheck(checkFile, metadataFile)
results


