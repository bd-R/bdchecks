shiny::fluidPage(
  shinyjs::useShinyjs(),
  shiny::conditionalPanel(
    "!input.accept_file",
    shiny::h2("Upload and Accept Dataset")
  ),
  shiny::conditionalPanel(
    "input.accept_file",
    shiny::fluidRow(
      shiny::column(
        width = 2,
        shiny::radioButtons(
          "dc_groups_vailable",
          "Select category to group data checks:",
          c(
            "Darwin Core Class" = "DarwinCoreClass",
            "Dimension" = "Dimension",
            "Warning Type" = "Warning",
            "Output Type" = "Output",
            "Severity" = "Severity"
          ),
          "DarwinCoreClass"
        )
      ),
      shiny::column(
        width = 3,
        shiny::actionButton("select_dc", "Accept Data Checks",
          icon = shiny::icon("check"),
          width = 210,
          style = "color: #000000;
                   background-color: #71a879;
                   border-color: #091520;
                   padding:10px; font-size:120%"
        )
      ),
      shiny::br(), shiny::br(),
      shiny::column(12, style = "margin-bottom:10px; border-bottom:2px solid")
    ),
    shiny::br(), shiny::br(),
    shiny::fluidRow(
      shiny::uiOutput("dc_groups_check_box")
    ),
    shiny::uiOutput("dc_check_box_hover")
  )
)