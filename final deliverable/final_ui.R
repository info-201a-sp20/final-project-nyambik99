source('final_server.R')

ui <- navbarPage(
  "Americans Sleeping Analysis",
  
  ## Actually first page
  introduction <- tabPanel("Introduction",
                    mainPanel(
                      includeHTML('into_paragraph.html'),
                    )
  ),
  
  ## Page 1
  page1 <- tabPanel("Age",
                  titlePanel("Average Sleeping Hours by Age Group"),
                  sidebarLayout(
                    sidebarPanel(
                      
                      ### Modify graph
                      radioButtons(
                        "Age",
                        label = "Choose an age group",
                        choices = list(
                          "15 years and over" = "15 years and over",
                          "15 to 24 years" = "15 to 24 years",
                          "25 to 34 years" = "25 to 34 years",
                          "35 to 44 years" = "35 to 44 years",
                          "45 to 54 years" = "45 to 54 years",
                          "55 to 64 years" = "55 to 64 years",
                          "65 years and over" = "65 years and over"
                        )
                      )
                    ),
                    
                    ### Plot the graph
                    mainPanel(
                      plotlyOutput("plot1")
                    )
                  )
  ),
  
  ## Page 2
  page2 <- tabPanel("Sex",
                  titlePanel("Average Sleeping Hours by Sex"),
                  sidebarLayout(
                    sidebarPanel(
                      
                      ### Modify graph
                      radioButtons(
                        "Sex",
                        label = "Choose a sex",
                        choices = list(
                          "Both" = "Both",
                          "Men" = "Men",
                          "Women" = "Women"
                        )
                      )
                    ),
                    
                    ### Plot the graph
                    mainPanel(
                      plotlyOutput("plot2")
                    )
                  )
  ),
  
  page3 <- tabPanel("Dataset Exploration",
    titlePanel("Time Americans Spend Sleeping Dataset Exploration"),
    sidebarLayout(
      sidebarPanel(
        
        x_input,
        y_input,
        color_input,
        size_input
        
      ),
      
      mainPanel(
        plotlyOutput("scatter")
      )
    )
  ),
  
  conclusion <- tabPanel("Conclusion",
    mainPanel(
      includeHTML('conclusion.html'),
    )
  )
)

