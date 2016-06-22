shinyUI(fluidPage(
    titlePanel("Population Density"),
	tags$head(tags$script(src="http://d3js.org/d3.v3.min.js")),
  	tags$head(tags$script(src="http://d3js.org/topojson.v1.min.js")),
  	tags$head(tags$script(src="http://d3js.org/queue.v1.min.js")),
	sidebarLayout(
    # Sidebar with a slider and selection inputs
    sidebarPanel(
      selectInput("selection", "Choose a year:",
                  choices = years),
      selectInput("selectRegion", "Choose a region:",
                  choices = regionList),                  
      actionButton("update", "Change"),
      hr()
    ),
        
    # Show Word Cloud
    mainPanel(
      uiOutput('map')
    )
  )
))