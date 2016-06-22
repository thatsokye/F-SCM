shinyServer(function(input, output, session) {
  
  terms <- reactive({
    # Change when the "update" button is pressed...
    input$update
    # ...but not for anything else
    isolate({
      withProgress({
        setProgress(message = "Processing corpus...")
        getPage(input$selection, input$selectRegion)
      })
    })
  })
  
  
  output$map<-renderUI({terms()})
  
})