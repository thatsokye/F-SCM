load('www/map.RData')


years <<- list("2012" = "2012",
               "2013" = "2013",
               "2014" = "2014",
               "2015" = "2015",
               "2016" = "2016")

regionList <<- list( "ALL" = "All",
                     "China" = "chinese",
                     "Vetnam" = "vetnam",
                     "Philippines" = "Philippines",
                     "Indonesia" = "Indonesia",
                     "Uzbekistan" = "Uzbekistan",
                     "America" = "America",
                     "Cambodia" = "Cambodia",
                     "Japan" = "Japan",
                     "Thailand" = "Thailand",
                     "Taiwan" = "Taiwan")


getPage <- (function(isYear, isRegion) {
  if (!(isYear %in% years))
    stop("Unknown years")
  if (!(isRegion %in% regionList))
    stop("Unknown region")
  
  fileData <- fileData2012
  
  if (isYear=='2012')
    print (isYear)
  if (isYear=='2013')
    fileData <- fileData2013
  if (isYear=='2014')
    fileData <- fileData2014
  if (isYear=='2015')
    fileData <- fileData2016    
  if (isYear=='2016')
    fileData <- fileData2016
  
  newData <- fileData[1]  
  newData$population <- fileData$population
  if (isRegion == 'chinese')
    newData$population <- fileData$chinese
  if (isRegion == 'vetnam')
    newData$population <- fileData$vetnam
  if (isRegion == 'Philippines')
    newData$population <- fileData$Philippines
  if (isRegion == 'Indonesia')
    newData$population <- fileData$Indonesia
  if (isRegion == 'Uzbekistan')
    newData$population <- fileData$Uzbekistan
  if (isRegion == 'America')
    newData$population <- fileData$America
  if (isRegion == 'Cambodia')
    newData$population <- fileData$Cambodia
  if (isRegion == 'Japan')
    newData$population <- fileData$Japan
  if (isRegion == 'Thailand')
    newData$population <- fileData$Thailand
  if (isRegion == 'Taiwan')
    newData$population <- fileData$Taiwan
  
  
  write.csv(newData, file = "www/oCountry_Resid.csv", row.names = FALSE)
  return(includeHTML("./www/index.html"))
  
})