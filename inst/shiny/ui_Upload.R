online_databases <- list(
  "GBIF (Global Biodiversity Information Facility)" = "gbif",
  "iDigBio (Integrated Digitized Biocollections)" = "idigbio",
  "EcoEngine (Berkeley Ecoinformatics Engine)" = "ecoengine",
  "Vertnet (Vertebrate Network)" = "vertnet",
  "BISON (Biodiversity Information Serving Our Nation)" = "bison",
  "iNaturalist" = "inat",
  "ALA (Atlas of Living Australia)" = "ala",
  "OBIS (Ocean Biogeographic Information System)" = "obis",
  "AntWeb" = "antweb"
)

shiny::fluidPage(
  shiny::titlePanel("Upload Data"), shiny::sidebarLayout(
    sidebar_panel2(
      module_uploaddata_ui("main"),
      out = shinyjs::disabled(shiny::actionButton(
        "accept_file",
        "Accept Dataset",
        icon = shiny::icon("check"),
        width = 210,
        style = "color: #000000;
                        background-color: #71a879;
                        border-color: #091520;
                        padding:10px; font-size:120%"
      ))
    ),
    shiny::mainPanel(
      DT::dataTableOutput("contents")
    )
  )
)